import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qack/presentation/history/models/history.dart';
import 'package:qack/presentation/history/repositories/repositories.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this.historyRepository) : super(const HistoryState()) {
    on<HistoryFetched>(_onHistoryFetched);
    on<HistoryFiltered>(_onHistoryFiltered);
  }
  final HistoryRepository historyRepository;

  Future<void> _onHistoryFetched(
    HistoryFetched event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      emit(state.loading());
      // Fetch history from the database
      final history = await historyRepository.fetchTranslationHistory();

      emit(state.fetchSuccess(history));
    } on Exception catch (e) {
      emit(state.error(e));
    }
  }

  void _onHistoryFiltered(
    HistoryFiltered event,
    Emitter<HistoryState> emit,
  ) {
    final filteredHistory = historyRepository.filterHistory(
      state.history,
      event.query,
    );

    emit(state.filterSuccess(filteredHistory, state.history));
  }
}
