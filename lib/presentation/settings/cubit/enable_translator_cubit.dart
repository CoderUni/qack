import 'package:bloc/bloc.dart';
import 'package:qack/presentation/settings/models/translator_details.dart';

class EnableTranslatorCubit extends Cubit<Map<Translator, bool>> {
  EnableTranslatorCubit(List<Translator>? enabledTranslators)
      : super({
          for (final translator in Translator.values)
            // Check if the translator is in the list of enabled translators
            translator: enabledTranslators != null &&
                enabledTranslators.contains(translator),
        });

  void toggleTranslator({
    required Translator translator,
    required bool value,
  }) {
    final currentState = Map<Translator, bool>.from(state);
    currentState[translator] = value;

    emit(currentState);
  }
}
