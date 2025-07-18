import 'dart:async';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http_client/http_client.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/presentation/home/models/baidu_translation.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/models/deepseek/deepseek_chat_completion.dart';
import 'package:qack/presentation/home/models/deepseek/deepseek_message.dart';
import 'package:qack/presentation/home/models/models.dart';
import 'package:qack/presentation/home/models/youdao_translation.dart';
import 'package:qack/presentation/settings/models/models.dart';
import 'package:qack/utils/database/database.dart';

final class HomeRepository {
  const HomeRepository({
    required this.storage,
  });
  final FlutterSecureStorage storage;

  Stream<BaseTranslationDetails> translateText(
    String text, {
    required AppDatabase db,
    required TranslatorSettings translatorSettings,
  }) async* {
    final enabledTranslators = translatorSettings.enabledTranslators;
    final apiKeys = translatorSettings.apiKeys;

    final httpClient = GetIt.I<Http>();

    // Definite the root isolate token
    final rootIsolateToken = RootIsolateToken.instance!;

    final futures = <Future<BaseTranslationDetails>>[];

    // Detect the source and target language
    final srcLanguage = _detectLanguage(text);

    late final Language targetLanguage;

    switch (srcLanguage) {
      case Language.chinese:
        targetLanguage = Language.english;
      case Language.english:
        targetLanguage = Language.chinese;
      case Language.auto:
      case Language.unknown:
        targetLanguage = Language.english;
    }

    for (final translator in enabledTranslators) {
      switch (translator) {
        case Translator.google:
          if (apiKeys[KeyNameConstants.google] != null) {
            // TODO: Implement Google translation
          }
        case Translator.baidu:
          if (apiKeys[KeyNameConstants.baiduAppID] != null &&
              apiKeys[KeyNameConstants.baiduSecretKey] != null) {
            futures.add(
              Isolate.run(
                () async => _translateBaidu(
                  text,
                  httpClient,
                  rootIsolateToken,
                  srcLanguage: srcLanguage.code ?? Language.auto.code!,
                  targetLanguage: targetLanguage.code!,
                  translatorSettings: translatorSettings,
                ),
              ),
            );
          }
        case Translator.deepSeek:
          if (apiKeys[KeyNameConstants.deepSeek] != null) {
            // Add a loading status for slow translators like deepseek
            yield DeepSeekTranslation.loading();

            futures.add(
              Isolate.run(
                () async => _askDeepseek(
                  text,
                  httpClient,
                  rootIsolateToken,
                  // src and target lang are manually set to auto
                  // in [DeepseekChatCompletion]
                  srcLanguage: srcLanguage.code ?? Language.auto.code!,
                  targetLanguage: targetLanguage.code!,
                  translatorSettings: translatorSettings,
                ),
              ),
            );
          }
        case Translator.youDao:
          if (apiKeys[KeyNameConstants.youDaoAppID] != null &&
              apiKeys[KeyNameConstants.youDaoSecretKey] != null) {
            futures.add(
              Isolate.run(
                () async => _translateYouDao(
                  text,
                  httpClient,
                  rootIsolateToken,
                  srcLanguage: srcLanguage.code ?? Language.auto.code!,
                  targetLanguage: targetLanguage.code!,
                  translatorSettings: translatorSettings,
                ),
              ),
            );
          }
      }
    }

    // Store the translation request in the database
    final historyId = await db.into(db.translationHistory).insert(
          TranslationHistoryCompanion(
            createdAt: Value(DateTime.now().toIso8601String()),
            input: Value(text),
          ),
        );

    // Yield the output of each translation service and store the results
    for (final future in futures) {
      final translationDetails = await future;
      yield translationDetails;

      await db.into(db.translationHistoryItem).insert(
            TranslationHistoryItemCompanion(
              parentID: Value(historyId),
              translator: Value(translationDetails.translatorName.index),
              output: Value(
                translationDetails.translatedText?.outputText.trim() ?? '',
              ),
            ),
          );
    }

    return;
  }

  Future<BaiduTranslation> _translateBaidu(
    String inputText,
    Http httpClient,
    RootIsolateToken rootIsolateToken, {
    required String srcLanguage,
    required String targetLanguage,
    required TranslatorSettings translatorSettings,
  }) async {
    try {
      // Initialize platform channel plugins (like http) in the isolate
      BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

      final appID = translatorSettings.apiKeys[KeyNameConstants.baiduAppID];
      final secretKey =
          translatorSettings.apiKeys[KeyNameConstants.baiduSecretKey];

      if (appID == null || secretKey == null) {
        throw ArgumentError(
          'Baidu Translation keys are null. appId: $appID, secretKey: '
          '$secretKey',
        );
      }

      final salt = await storage.read(key: KeyNameConstants.md5Salt);
      if (salt == null) {
        throw ArgumentError('Baidu MD5 salt is null');
      }

      final request = BaiduTranslationRequest(
        inputText: inputText,
        srcLanguage: srcLanguage,
        targetLanguage: targetLanguage,
        appID: appID,
        salt: salt,
      );

      final signature = BaiduTranslationRequest.createSignJson(
        appID: appID,
        inputText: inputText,
        salt: salt,
        secretKey: secretKey,
      );

      final encodedUrl = request
          .toJson()
          .entries
          .map(
            (e) => '${Uri.encodeComponent(e.key)}='
                '${Uri.encodeComponent('${e.value}')}',
          )
          .join('&');

      final response = await httpClient.rawGet(
        Uri.parse('${LinkConstants.baiduTranslateTranslationUrl}?$encodedUrl'
            '&sign=$signature'),
      );

      final data = response.data as Map<String, dynamic>;

      // Specific error only if Baidu was able to receive the request and
      // responds with an error code
      if (data['error_code'] != null) {
        throw FailedBaiduTranslation.fromJson(data);
      }

      return BaiduTranslation.fromJson(data);
    } on Exception catch (e) {
      return BaiduTranslation.error(e);
    }
  }

  Future<DeepSeekTranslation> _askDeepseek(
    String inputText,
    Http httpClient,
    RootIsolateToken rootIsolateToken, {
    required String srcLanguage,
    required String targetLanguage,
    required TranslatorSettings translatorSettings,
  }) async {
    try {
      // Initialize platform channel plugins (like http) in the isolate
      BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

      final secretKey = translatorSettings.apiKeys[KeyNameConstants.deepSeek];

      if (secretKey == null) {
        throw ArgumentError(
          'Deepseek secret key is null. SecretKey: $secretKey',
        );
      }

      final deepseekCompletionRequest = DeepSeekChatCompletionRequest(
        prompt: inputText,
        model: DeepSeekModel.chat,
        messages: [
          DeepSeekUserMessage(
            uContent: 'Translate to ${targetLanguage.toUpperCase()}:'
                ' $inputText',
          ),
        ],
        responseFormat: DeepSeekResponseFormat.string,
      );

      final response = await httpClient.post(
        LinkConstants.deepSeekChatCompletionUrl,
        deepseekCompletionRequest.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $secretKey',
        },
      );

      return DeepSeekTranslation(
        DeepseekChatCompletion.fromJson(
          response.data as Map<String, dynamic>,
        ),
      );
    } on Exception catch (e) {
      return DeepSeekTranslation(
        DeepseekChatCompletion.error(e),
      );
    }
  }

  Future<YouDaoTranslation> _translateYouDao(
    String inputText,
    Http httpClient,
    RootIsolateToken rootIsolateToken, {
    required String srcLanguage,
    required String targetLanguage,
    required TranslatorSettings translatorSettings,
  }) async {
    try {
      // Initialize platform channel plugins (like http) in the isolate
      BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

      final appID = translatorSettings.apiKeys[KeyNameConstants.youDaoAppID];
      final secretKey =
          translatorSettings.apiKeys[KeyNameConstants.youDaoSecretKey];

      if (appID == null || secretKey == null) {
        throw ArgumentError(
          'YouDao Translation keys are null. appId: $appID, secretKey: '
          '$secretKey',
        );
      }

      final salt = await storage.read(key: KeyNameConstants.md5Salt);
      if (salt == null) {
        throw ArgumentError('YouDao MD5 salt is null');
      }

      final secondsSinceEpoch = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final request = YouDaoTranslationRequest(
        inputText: inputText,
        srcLanguage: srcLanguage,
        targetLanguage: targetLanguage,
        appID: appID,
        salt: salt,
        secondsSinceEpoch: secondsSinceEpoch,
      );

      final signature = YouDaoTranslationRequest.createSignJson(
        appID: appID,
        inputText: inputText,
        salt: salt,
        secondsSinceEpoch: secondsSinceEpoch,
        secretKey: secretKey,
      );

      final encodedUrl = request
          .toJson()
          .entries
          .map(
            (e) => '${Uri.encodeComponent(e.key)}='
                '${Uri.encodeComponent('${e.value}')}',
          )
          .join('&');

      final response = await httpClient.rawGet(
        Uri.parse('${LinkConstants.youDaoTranslateTextUrl}?$encodedUrl'
            '&sign=$signature'),
      );

      if (response.data is! Map<String, dynamic>) {
        throw Exception(
          'Unexpected response format from YouDao API: ${response.data}',
        );
      }

      final data = response.data as Map<String, dynamic>;

      // YouDao returns '0' (as a string) for success.
      // Any other value indicates an error.
      if (data['errorCode'] != '0') {
        throw FailedYouDaoTranslation.fromJson(data);
      }

      return YouDaoTranslation.fromJson(data);
    } on Exception catch (e) {
      return YouDaoTranslation.error(
        e,
        errorCode: 'Caught a general Exception. Not a FailedYouDaoTranslation',
        langPair: '',
        query: inputText,
      );
    }
  }

  Language _detectLanguage(String text) {
    // detect chinese characters using regex
    final chineseRegex = RegExp(r'[\u4e00-\u9fff]');
    final englishRegex = RegExp('[a-zA-Z]');

    final totalChineseMatches = chineseRegex.allMatches(text);
    final totalEnglishMatches = englishRegex.allMatches(text);

    if (totalChineseMatches.length > totalEnglishMatches.length) {
      return Language.chinese;
    } else if (totalEnglishMatches.length > totalChineseMatches.length) {
      return Language.english;
    } else {
      return Language.unknown;
    }
  }
}
