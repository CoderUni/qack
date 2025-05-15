import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http_client/http_client.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/constants/key_name_constants.dart';
import 'package:qack/constants/link_constants.dart';
import 'package:qack/presentation/home/models/baidu_translation.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/models/deepseek_chat_completion.dart';
import 'package:qack/presentation/home/models/deepseek_message.dart';
import 'package:qack/presentation/settings/models/models.dart';

final class HomeRepository {
  const HomeRepository({
    required this.storage,
  });
  final FlutterSecureStorage storage;

  Future<TranslationDetails> translateText(
    String text, {
    required String srcLanguage,
    required String targetLanguage,
    required TranslatorSettings translatorSettings,
  }) async {
    final enabledTranslators = translatorSettings.enabledTranslators;
    final apiKeys = translatorSettings.apiKeys;

    final translationDetails = <String, BaseTranslationDetails>{};

    for (final translator in enabledTranslators) {
      switch (translator) {
        case Translator.google:
          if (apiKeys[KeyNameConstants.google] != null) {
            // TODO: Implement Google translation
          }
        case Translator.baidu:
          if (apiKeys[KeyNameConstants.baiduAppID] != null &&
              apiKeys[KeyNameConstants.baiduSecretKey] != null) {
            final baiduTranslation = await _translateBaidu(
              text,
              srcLanguage: srcLanguage,
              targetLanguage: targetLanguage,
              translatorSettings: translatorSettings,
            );

            translationDetails[translator.name] = baiduTranslation;
          }
        case Translator.deepSeek:
          if (apiKeys[KeyNameConstants.deepSeek] != null) {
            final deepSeekChatCompletion = await _askDeepseek(
              text,
              // src and target lang are manually set to auto
              // in [DeepseekChatCompletion]
              srcLanguage: srcLanguage,
              targetLanguage: targetLanguage,
              translatorSettings: translatorSettings,
            );

            translationDetails[translator.name] = deepSeekChatCompletion;
          }
      }
    }

    return translationDetails;
  }

  Future<BaiduTranslation> _translateBaidu(
    String inputText, {
    required String srcLanguage,
    required String targetLanguage,
    required TranslatorSettings translatorSettings,
  }) async {
    final httpClient = GetIt.I<Http>();

    final appID = translatorSettings.apiKeys[KeyNameConstants.baiduAppID];
    final secretKey =
        translatorSettings.apiKeys[KeyNameConstants.baiduSecretKey];

    if (appID == null || secretKey == null) {
      throw ArgumentError(
        'Baidu Translation keys are null. appId: $appID, secretKey: $secretKey',
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
              '${Uri.encodeComponent(e.value as String)}',
        )
        .join('&');

    final response = await httpClient.rawGet(
      Uri.parse('${LinkConstants.baiduTranslateTranslationUrl}?$encodedUrl'
          '&sign=$signature'),
    );

    final data = response.data as Map<String, dynamic>;
    if (data['error_code'] != null) {
      throw FailedBaiduTranslation.fromJson(data);
    }

    return BaiduTranslation.fromJson(response.data as Map<String, dynamic>);
  }

  Future<DeepseekChatCompletion> _askDeepseek(
    String inputText, {
    required String srcLanguage,
    required String targetLanguage,
    required TranslatorSettings translatorSettings,
  }) async {
    final httpClient = GetIt.I<Http>();

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
          uContent:
              'Translate to English if the text is in Chinese or vice versa. '
              'Only translate and nothing else.'
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

    return DeepseekChatCompletion.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
