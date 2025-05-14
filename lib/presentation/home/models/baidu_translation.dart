// ignore_for_file: use_super_parameters

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baidu_translation.g.dart';

@JsonSerializable()
final class BaiduTranslation extends BaseTranslationDetails {
  const BaiduTranslation({
    required this.baiduSrcLanguage,
    required this.baidutargetLanguage,
    required this.baiduTranslatedText,
  }) : super(
          srcLanguage: baiduSrcLanguage,
          targetLanguage: baidutargetLanguage,
          translatedText: baiduTranslatedText,
        );

  factory BaiduTranslation.fromJson(Map<String, dynamic> json) =>
      _$BaiduTranslationFromJson(json);

  @JsonKey(name: 'from', includeToJson: false)
  final String baiduSrcLanguage;
  @JsonKey(name: 'to', includeToJson: false)
  final String baidutargetLanguage;

  @_TranslatedTextSerializer()
  @JsonKey(name: 'trans_result', includeToJson: false)
  final TranslatedText baiduTranslatedText;

  /// This should not be implemented since the toJson method is not used in the
  /// BaiduTranslation class.
  // Map<String, dynamic> toJson() => _$BaiduTranslationToJson(this);
}

@JsonSerializable()
final class FailedBaiduTranslation extends BaseTranslationError
    with EquatableMixin {
  const FailedBaiduTranslation({
    required this.errorCode,
    required this.baiduErrorMessage,
  }) : super(errorMessage: baiduErrorMessage);

  factory FailedBaiduTranslation.fromJson(Map<String, dynamic> json) =>
      _$FailedBaiduTranslationFromJson(json);

  @JsonKey(name: 'error_code', includeToJson: false)
  final String errorCode;

  @JsonKey(name: 'error_msg', includeToJson: false)
  final String baiduErrorMessage;

  @override
  List<Object?> get props => [errorCode, baiduErrorMessage];

  @override
  String toString() =>
      'BaiduTranslation err code: $errorCode, err msg:$baiduErrorMessage';
}

class _TranslatedTextSerializer
    implements JsonConverter<TranslatedText, List<dynamic>> {
  const _TranslatedTextSerializer();

  @override
  TranslatedText fromJson(List<dynamic> json) {
    if (json.isEmpty) {
      throw ArgumentError('Baidu translation returned an empty trans_result.');
    }

    try {
      // ignore: avoid_dynamic_calls
      final inputText = json[0]['src'] as String? ?? 'Error';
      // ignore: avoid_dynamic_calls
      final outputText = json[0]['dst'] as String? ?? 'Error';

      return TranslatedText(
        inputText: inputText,
        outputText: outputText,
      );
    } on Exception catch (e) {
      throw ArgumentError(e);
    }
  }

  /// This should not be implemented since the toJson method is not used in the
  /// BaiduTranslation class.
  @override
  List<Map<String, String>> toJson(TranslatedText object) {
    throw UnimplementedError();
  }
}

/// {@template baidu_translation_request}
/// Request model for Baidu translation API.
/// {@endtemplate}
@JsonSerializable()
final class BaiduTranslationRequest {
  /// {@macro baidu_translation_request}
  const BaiduTranslationRequest({
    required this.inputText,
    required this.srcLanguage,
    required this.targetLanguage,
    required this.appID,
    required this.salt,
  });

  @JsonKey(name: 'q')
  final String inputText;

  @JsonKey(name: 'from')
  final String srcLanguage;
  @JsonKey(name: 'to')
  final String targetLanguage;

  @JsonKey(name: 'appid')
  final String appID;

  @JsonKey(name: 'salt')
  final String salt;

  /// Creates a sign for the Baidu translation request.
  static String createSignJson({
    required String appID,
    required String inputText,
    required String salt,
    required String secretKey,
  }) {
    final sign = '$appID$inputText$salt$secretKey';

    final hashedSign = utf8.encode(sign);

    return md5.convert(hashedSign).toString();
  }

  Map<String, dynamic> toJson() => _$BaiduTranslationRequestToJson(this);
}
