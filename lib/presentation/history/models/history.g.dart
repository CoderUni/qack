// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslationHistoryItem _$TranslationHistoryItemFromJson(
        Map<String, dynamic> json) =>
    TranslationHistoryItem(
      id: (json['id'] as num).toInt(),
      parentID: (json['parentID'] as num).toInt(),
      translator: (json['translator'] as num).toInt(),
      output: json['output'] as String,
    );

Map<String, dynamic> _$TranslationHistoryItemToJson(
        TranslationHistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentID': instance.parentID,
      'translator': instance.translator,
      'output': instance.output,
    };
