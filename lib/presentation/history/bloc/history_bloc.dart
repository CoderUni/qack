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
      emit(state.success(history));
    } on Exception catch (e) {
      emit(state.error(e));
    }
  }
}
