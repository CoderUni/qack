// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_of_the_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordOfTheDay _$WordOfTheDayFromJson(Map<String, dynamic> json) => WordOfTheDay(
      word: json['word'] as String,
      pinyin: json['pinyin'] as String,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      exampleSentences: (json['exampleSentences'] as List<dynamic>?)
          ?.map((e) => ExampleSentence.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WordOfTheDayToJson(WordOfTheDay instance) =>
    <String, dynamic>{
      'word': instance.word,
      'pinyin': instance.pinyin,
      'definitions': instance.definitions,
      'exampleSentences': instance.exampleSentences,
    };
