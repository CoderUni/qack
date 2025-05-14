// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslatorDetails _$TranslatorDetailsFromJson(Map<String, dynamic> json) =>
    _TranslatorDetails(
      enabledTranslators: (json['enabledTranslators'] as List<dynamic>)
          .map((e) => $enumDecode(_$TranslatorEnumMap, e))
          .toList(),
      apiKeys: Map<String, String>.from(json['apiKeys'] as Map),
    );

Map<String, dynamic> _$TranslatorDetailsToJson(_TranslatorDetails instance) =>
    <String, dynamic>{
      'enabledTranslators': instance.enabledTranslators
          .map((e) => _$TranslatorEnumMap[e]!)
          .toList(),
      'apiKeys': instance.apiKeys,
    };

const _$TranslatorEnumMap = {
  Translator.google: 'google',
  Translator.baidu: 'baidu',
  Translator.deepSeek: 'deepSeek',
};
