import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qack/presentation/dictionary/repositories/repositories.dart';
import 'package:qack/utils/database/database.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictionaryBloc(this.repository) : super(const DictionaryState()) {
    on<DictionaryFetched>(_onDictionaryFetched);
    on<DictionaryQueried>(_onDictionaryQueried);
  }
  final DictionaryRepository repository;

  Future<void> _onDictionaryFetched(
    DictionaryFetched event,
    Emitter<DictionaryState> emit,
  ) async {
    try {
      final entries = await repository.fetchDictionaryEntries();

      emit(
        state.copyWith(
          method: DictionaryMethod.fetchDictionary,
          status: DictionaryStatus.success,
          dictionaryEntries: entries,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          method: DictionaryMethod.fetchDictionary,
          status: DictionaryStatus.failure,
        ),
      );

      await Sentry.captureException(
        e,
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<void> _onDictionaryQueried(
    DictionaryQueried event,
    Emitter<DictionaryState> emit,
  ) async {
    try {
      final entries = await repository.queryDictionaryEntries(event.query);

      emit(
        state.copyWith(
          method: DictionaryMethod.queryDictionary,
          status: DictionaryStatus.success,
          dictionaryEntries: entries,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          method: DictionaryMethod.queryDictionary,
          status: DictionaryStatus.failure,
        ),
      );

      await Sentry.captureException(
        e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
