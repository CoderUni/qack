import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
    required this.settingsBloc,
  }) : super(const HomeInitial()) {
    on<HomeTextChanged>(
      _onHomeTextChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  final HomeRepository homeRepository;
  final SettingsBloc settingsBloc;

  Future<void> _onHomeTextChanged(
    HomeTextChanged event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(const HomeTextTranslateLoading());

      final sourceText = event.sourceText.trim();

      if (sourceText.isEmpty) {
        emit(const HomeTextStateEmpty());
        return;
      }

      // TODO: call deepl translator here
      // Check if majority of the text is in English or Chinese
      // and then change the target_lang to the other language
      // Set source_lang manually if the auto-detect is not good

      final translationDetails = await homeRepository.translateText(
        sourceText,
        srcLanguage: 'auto',
        targetLanguage: 'zh',
        translatorSettings: settingsBloc.state.translatorSettings!,
      );

      emit(HomeTextTranslateSuccess(translationDetails: translationDetails));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(HomeTextTranslateError(exception: e));
    }
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
