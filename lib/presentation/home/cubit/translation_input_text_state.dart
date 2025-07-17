part of 'translation_input_text_cubit.dart';

class TranslationInputTextState extends Equatable {
  const TranslationInputTextState({
    this.alignmentHeightFactor = 1,
    this.isFocused = false,
  });

  final double alignmentHeightFactor;
  final bool isFocused;

  @override
  List<Object?> get props => [alignmentHeightFactor, isFocused];

  TranslationInputTextState copyWith({
    double? alignmentHeightFactor,
    bool? isFocused,
  }) {
    return TranslationInputTextState(
      alignmentHeightFactor:
          alignmentHeightFactor ?? this.alignmentHeightFactor,
      isFocused: isFocused ?? this.isFocused,
    );
  }
}
