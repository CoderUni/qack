// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleSentence _$ExampleSentenceFromJson(Map<String, dynamic> json) =>
    ExampleSentence(
      sentence: json['sentence'] as String,
      pinyin: json['pinyin'] as String,
      translation: json['translation'] as String,
    );

Map<String, dynamic> _$ExampleSentenceToJson(ExampleSentence instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
      'pinyin': instance.pinyin,
      'translation': instance.translation,
    };
