import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qack/presentation/home/models/example_sentence.dart';

part 'word_of_the_day.g.dart';

@JsonSerializable()
final class WordOfTheDay extends Equatable {
  const WordOfTheDay({
    required this.word,
    required this.pinyin,
    required this.definitions,
    required this.exampleSentences,
  });

  factory WordOfTheDay.fromJson(Map<String, dynamic> json) =>
      _$WordOfTheDayFromJson(json);

  final String word;
  final String pinyin;
  final List<String>? definitions;
  final List<ExampleSentence>? exampleSentences;

  @override
  List<Object?> get props => [word, pinyin, definitions, exampleSentences];

  @override
  String toString() {
    return 'WordOfTheDay{'
        'words: $word, '
        'pinyin: $pinyin, '
        'definitions: $definitions, '
        'exampleSentences: $exampleSentences'
        '}';
  }
}
