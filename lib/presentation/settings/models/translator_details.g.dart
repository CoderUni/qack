// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslatorDetails _$TranslatorDetailsFromJson(Map<String, dynamic> json) =>
    _TranslatorDetails(
      enabledTranslators: (json['enabledTranslators'] as List<dynamic>)
          .map((e) => $enumDecode(_$TranslatorAppEnumMap, e))
          .toList(),
      apiKeys: Map<String, String>.from(json['apiKeys'] as Map),
    );

Map<String, dynamic> _$TranslatorDetailsToJson(_TranslatorDetails instance) =>
    <String, dynamic>{
      'enabledTranslators': instance.enabledTranslators
          .map((e) => _$TranslatorAppEnumMap[e]!)
          .toList(),
      'apiKeys': instance.apiKeys,
    };

const _$TranslatorAppEnumMap = {
  TranslatorApp.google: 'google',
  TranslatorApp.baidu: 'baidu',
};
