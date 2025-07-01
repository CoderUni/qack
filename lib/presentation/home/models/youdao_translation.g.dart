// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youdao_translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YouDaoTranslation _$YouDaoTranslationFromJson(Map<String, dynamic> json) =>
    YouDaoTranslation(
      errorCode: json['errorCode'] as String,
      query: json['query'] as String,
      translation: (json['translation'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      langPair: json['l'] as String,
      dict: (json['dict'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      webdict: (json['webdict'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      tSpeakUrl: json['tSpeakUrl'] as String?,
      speakUrl: json['speakUrl'] as String?,
    );

Map<String, dynamic> _$YouDaoTranslationToJson(YouDaoTranslation instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'query': instance.query,
      'translation': instance.translation,
      'dict': instance.dict,
      'webdict': instance.webdict,
      'tSpeakUrl': instance.tSpeakUrl,
      'speakUrl': instance.speakUrl,
      'l': instance.langPair,
    };

FailedYouDaoTranslation _$FailedYouDaoTranslationFromJson(
        Map<String, dynamic> json) =>
    FailedYouDaoTranslation(
      errorCode: json['errorCode'] as String,
      langPair: json['l'] as String,
    );

Map<String, dynamic> _$FailedYouDaoTranslationToJson(
        FailedYouDaoTranslation instance) =>
    <String, dynamic>{};

YouDaoTranslationRequest _$YouDaoTranslationRequestFromJson(
        Map<String, dynamic> json) =>
    YouDaoTranslationRequest(
      inputText: json['q'] as String,
      srcLanguage: json['from'] as String,
      targetLanguage: json['to'] as String,
      appID: json['appKey'] as String,
      salt: json['salt'] as String,
      secondsSinceEpoch: (json['curtime'] as num).toInt(),
      signType: json['signType'] as String? ?? 'v3',
    );

Map<String, dynamic> _$YouDaoTranslationRequestToJson(
        YouDaoTranslationRequest instance) =>
    <String, dynamic>{
      'q': instance.inputText,
      'from': instance.srcLanguage,
      'to': instance.targetLanguage,
      'appKey': instance.appID,
      'salt': instance.salt,
      'signType': instance.signType,
      'curtime': instance.secondsSinceEpoch,
    };
