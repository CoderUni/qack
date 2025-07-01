// ignore_for_file: use_super_parameters

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';

part 'youdao_translation.g.dart';

@JsonSerializable()
final class YouDaoTranslation extends BaseTranslationDetails {
  YouDaoTranslation({
    required this.errorCode,
    required this.query,
    required this.translation,
    required this.langPair,
    required this.dict,
    required this.webdict,
    required this.tSpeakUrl,
    required this.speakUrl,
    TranslationStatus status = TranslationStatus.success,
    Exception? exception,
  }) : super(
          srcLanguage: langPair.split('2').first,
          targetLanguage: langPair.split('2').last,
          translatedText: TranslatedText(
            inputText: query,
            outputText: translation.fold(
              '',
              (previousValue, element) => '$previousValue \n $element\n',
            ),
          ),
          status: status,
          exception: exception,
        );

  YouDaoTranslation.loading(String query)
      : this(
          errorCode: '',
          query: query,
          translation: [],
          langPair: '',
          dict: null,
          webdict: null,
          tSpeakUrl: null,
          speakUrl: null,
          exception: null,
          status: TranslationStatus.loading,
        );

  YouDaoTranslation.error(
    Exception e, {
    required String errorCode,
    required String query,
    required String langPair,
  }) : this(
          errorCode: errorCode,
          query: query,
          translation: [],
          langPair: langPair,
          dict: null,
          webdict: null,
          tSpeakUrl: null,
          speakUrl: null,
          exception: e,
        );

  factory YouDaoTranslation.fromJson(Map<String, dynamic> json) =>
      _$YouDaoTranslationFromJson(json);

  final String errorCode;

  final String query;
  final List<String> translation;
  final Map<String, String>? dict; // Dictionary deeplink
  final Map<String, String>? webdict; // Web deeplink
  final String? tSpeakUrl; // Translated text speech URL
  final String? speakUrl; // Source text speech URL

  @JsonKey(name: 'l')
  final String langPair; // Language pair, e.g., "en2zh" for English to Chinese

  /// This should not be implemented since the toJson method is not used in the
  /// YouDaoTranslation class.
  // Map<String, dynamic> toJson() => _$YouDaoTranslationToJson(this);
}

@JsonSerializable()
final class FailedYouDaoTranslation extends BaseTranslationError
    with EquatableMixin {
  const FailedYouDaoTranslation({
    required this.errorCode,
    required this.langPair,
  }) : super(
          errorMessage: 'YouDao translation failed with error code: $errorCode',
        );

  factory FailedYouDaoTranslation.fromJson(Map<String, dynamic> json) =>
      _$FailedYouDaoTranslationFromJson(json);

  @JsonKey(name: 'errorCode', includeToJson: false)
  final String errorCode;

  // Translation language pair, e.g., "en2zh" for English to Chinese
  @JsonKey(name: 'l', includeToJson: false)
  final String langPair;

  @override
  List<Object?> get props => [errorCode, langPair];

  @override
  String toString() => 'YouDaoTranslation err code: $errorCode';
}

/// This should not be implemented since the toJson method is not used in the
/// YouDaoTranslation class.
@override
List<Map<String, String>> toJson(TranslatedText object) {
  throw UnimplementedError();
}

/// {@template youdao_translation_request}
/// Request model for YouDao translation API.
/// {@endtemplate}
@JsonSerializable()
final class YouDaoTranslationRequest {
  /// {@macro youdao_translation_request}
  const YouDaoTranslationRequest({
    required this.inputText,
    required this.srcLanguage,
    required this.targetLanguage,
    required this.appID,
    required this.salt,
    required this.secondsSinceEpoch,
    this.signType = 'v3',
  });

  @JsonKey(name: 'q')
  final String inputText;

  @JsonKey(name: 'from')
  final String srcLanguage;
  @JsonKey(name: 'to')
  final String targetLanguage;

  @JsonKey(name: 'appKey')
  final String appID;

  @JsonKey(name: 'salt')
  final String salt;

  @JsonKey(name: 'signType')
  final String signType;

  @JsonKey(name: 'curtime')
  final int secondsSinceEpoch;

  /// Creates a sign for the YouDao translation request.
  static String createSignJson({
    required String appID,
    required String inputText,
    required String salt,
    required int secondsSinceEpoch,
    required String secretKey,
  }) {
    // According to the YouDao API docs, if the inputText is longer than 20
    // characters, the input should be constructed as inputText
    // first 10 characters + inputText length + inputText last 10 characters.

    late final String editedInputText;

    if (inputText.length > 20) {
      editedInputText = '${inputText.substring(0, 10)}${inputText.length}'
          '${inputText.substring(inputText.length - 10)}';
    } else {
      editedInputText = inputText;
    }

    print(
      'YouDao sign: $appID$editedInputText$salt$secondsSinceEpoch$secretKey',
    );

    final sign = '$appID$editedInputText$salt$secondsSinceEpoch$secretKey';

    final hashedSign = utf8.encode(sign);

    return sha256.convert(hashedSign).toString();
  }

  Map<String, dynamic> toJson() => _$YouDaoTranslationRequestToJson(this);
}
