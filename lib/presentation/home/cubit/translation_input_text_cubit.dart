import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_input_text_state.dart';

class TranslationInputTextCubit extends Cubit<TranslationInputTextState> {
  TranslationInputTextCubit({required this.minLines})
      : super(
          TranslationInputTextState(
            alignmentHeightFactor: minLines.toDouble(),
          ),
        );
  final int minLines;

  void updateNewLineCount(int count, int maxLines) {
    late double heightFactor;

    if (count > maxLines) {
      heightFactor = maxLines.toDouble();
    } else {
      // Ensure the height factor is at least equal to minLines
      if (count < minLines) {
        heightFactor = minLines.toDouble();
      } else {
        heightFactor = count.toDouble();
      }
    }

    emit(state.copyWith(alignmentHeightFactor: heightFactor));
  }

  // ignore: avoid_positional_boolean_parameters
  void updateFocus(bool isFocused) {
    emit(state.copyWith(isFocused: isFocused));
  }
}
