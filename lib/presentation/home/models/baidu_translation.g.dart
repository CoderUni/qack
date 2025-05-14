// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baidu_translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaiduTranslation _$BaiduTranslationFromJson(Map<String, dynamic> json) =>
    BaiduTranslation(
      baiduSrcLanguage: json['from'] as String,
      baidutargetLanguage: json['to'] as String,
      baiduTranslatedText: const _TranslatedTextSerializer()
          .fromJson(json['trans_result'] as List),
    );

Map<String, dynamic> _$BaiduTranslationToJson(BaiduTranslation instance) =>
    <String, dynamic>{};

FailedBaiduTranslation _$FailedBaiduTranslationFromJson(
        Map<String, dynamic> json) =>
    FailedBaiduTranslation(
      errorCode: json['error_code'] as String,
      baiduErrorMessage: json['error_msg'] as String,
    );

Map<String, dynamic> _$FailedBaiduTranslationToJson(
        FailedBaiduTranslation instance) =>
    <String, dynamic>{};

BaiduTranslationRequest _$BaiduTranslationRequestFromJson(
        Map<String, dynamic> json) =>
    BaiduTranslationRequest(
      inputText: json['q'] as String,
      srcLanguage: json['from'] as String,
      targetLanguage: json['to'] as String,
      appID: json['appid'] as String,
      salt: json['salt'] as String,
    );

Map<String, dynamic> _$BaiduTranslationRequestToJson(
        BaiduTranslationRequest instance) =>
    <String, dynamic>{
      'q': instance.inputText,
      'from': instance.srcLanguage,
      'to': instance.targetLanguage,
      'appid': instance.appID,
      'salt': instance.salt,
    };
