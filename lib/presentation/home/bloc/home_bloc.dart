import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/presentation/settings/models/models.dart';
import 'package:qack/utils/database/database.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
    required this.settingsBloc,
    required this.appDatabase,
  }) : super(
          HomeState(
            _fillEmptyTranslationDetails(
              settingsBloc.state.translatorSettings!.enabledTranslators,
            ),
          ),
        ) {
    on<HomeTextCleared>(_onHomeTextCleared);
    on<HomeTextChanged>(
      _onHomeTextChanged,
      transformer: restartableDebounce(const Duration(milliseconds: 500)),
    );
  }

  final HomeRepository homeRepository;
  final SettingsBloc settingsBloc;

  final AppDatabase appDatabase;

  void _onHomeTextCleared(
    HomeTextCleared event,
    Emitter<HomeState> emit,
  ) {
    event.textController.clear();
    emit(state.empty());
  }

  Future<void> _onHomeTextChanged(
    HomeTextChanged event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.loading());

      final sourceText = event.sourceText.trim();

      if (sourceText.isEmpty) {
        emit(state.empty());
        return;
      }

      // TODO: Tell the user that the translation won't work if there is no
      // translator enabled
      if (settingsBloc.state.translatorSettings == null ||
          settingsBloc.state.translatorSettings!.enabledTranslators.isEmpty) {
        emit(state.failure(const NoTranslatorEnabledException()));
        return;
      }

      await emit.forEach(
        homeRepository.translateText(
          sourceText,
          db: appDatabase,
          translatorSettings: settingsBloc.state.translatorSettings!,
        ),
        onData: (baseTranslationDetail) {
          final translationDetails = Map.of(state.translationDetails);

          translationDetails[baseTranslationDetail.translatorName] =
              baseTranslationDetail;

          // For now, we register all the translated text even if they
          // are one letter apart

          return state.success(translationDetails);
        },
        onError: (e, stackTrace) {
          debugPrint('error: $e');
          return state.failure(Exception(e));
        },
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(state.failure(e));
    }
  }
}

EventTransformer<T> restartableDebounce<T>(Duration duration) {
  return (events, mapper) =>
      restartable<T>().call(events.debounceTime(duration), mapper);
}

Map<Translator, BaseTranslationDetails> _fillEmptyTranslationDetails(
  List<Translator> enabledTranslators,
) {
  return {
    for (final translator in enabledTranslators)
      translator: const EmptyTranslationDetails(),
  };
}
