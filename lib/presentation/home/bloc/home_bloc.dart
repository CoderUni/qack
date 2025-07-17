import 'dart:async';
import 'dart:developer';

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
import 'package:sentry_flutter/sentry_flutter.dart';

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
    on<HomeTranslatorRemoved>(_onHomeTranslatorRemoved);
  }

  final HomeRepository homeRepository;
  final SettingsBloc settingsBloc;

  final AppDatabase appDatabase;

  void _onHomeTextCleared(
    HomeTextCleared event,
    Emitter<HomeState> emit,
  ) {
    event.textController.clear();
    emit(state.empty(method: HomeMethod.textCleared));
  }

  Future<void> _onHomeTextChanged(
    HomeTextChanged event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.loading(method: HomeMethod.textChanged));

      final sourceText = event.sourceText.trim();

      if (sourceText.isEmpty) {
        emit(state.empty(method: HomeMethod.textChanged));
      } else if (settingsBloc.state.translatorSettings == null ||
          settingsBloc.state.translatorSettings!.enabledTranslators.isEmpty) {
        emit(
          state.failure(
            const NoTranslatorEnabledException(),
            method: HomeMethod.textChanged,
          ),
        );
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

          return state.success(
            translationDetails,
            method: HomeMethod.textChanged,
          );
        },
        onError: (e, stackTrace) {
          log('error: $e, stackTrace: $stackTrace');
          // Log error to Sentry
          Sentry.captureException(e, stackTrace: stackTrace);
          return state.failure(
            Exception('An error has occurred.'),
            method: HomeMethod.textChanged,
          );
        },
      );
    } on Exception catch (e) {
      log(e.toString());
      unawaited(Sentry.captureException(e));
      emit(
        state.failure(
          Exception('An error has occurred.'),
          method: HomeMethod.textChanged,
        ),
      );
    }
  }

  Future<void> _onHomeTranslatorRemoved(
    HomeTranslatorRemoved event,
    Emitter<HomeState> emit,
  ) async {
    // Remove existing translation details for the removed translators
    final updatedTranslationDetails = Map.of(state.translationDetails);

    if (event.removedTranslators.isEmpty) {
      return;
    }

    for (final translator in event.removedTranslators) {
      updatedTranslationDetails.remove(translator);
    }

    emit(
      state.copyWith(
        translationDetails: updatedTranslationDetails,
        method: HomeMethod.settingsApiKeyRemoved,
        // Deliberately not changing the status so that the UI depends on the
        // status of the last translation
      ),
    );
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
