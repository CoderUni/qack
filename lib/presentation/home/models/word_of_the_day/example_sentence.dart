import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_sentence.g.dart';

@JsonSerializable()
final class ExampleSentence extends Equatable {
  const ExampleSentence({
    required this.sentence,
    required this.pinyin,
    required this.translation,
  });

  factory ExampleSentence.fromJson(Map<String, dynamic> json) =>
      _$ExampleSentenceFromJson(json);

  final String sentence;
  final String pinyin;
  final String translation;

  @override
  List<Object?> get props => [sentence, pinyin, translation];
}
