import 'package:bloc/bloc.dart';
import 'package:qack/presentation/settings/models/translator_details.dart';

class EnableTranslatorCubit extends Cubit<Map<TranslatorApp, bool>> {
  EnableTranslatorCubit(List<TranslatorApp>? enabledTranslators)
      : super({
          for (final translator in TranslatorApp.values)
            // Check if the translator is in the list of enabled translators
            translator: enabledTranslators != null &&
                enabledTranslators.contains(translator),
        });

  void toggleTranslator({
    required TranslatorApp translator,
    required bool value,
  }) {
    final currentState = Map<TranslatorApp, bool>.from(state);
    currentState[translator] = value;

    emit(currentState);
  }
}
