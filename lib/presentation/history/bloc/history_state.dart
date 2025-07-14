part of 'history_bloc.dart';

enum HistoryMethod {
  initial,
  getHistory,
  deleteHistory,
}

enum HistoryStatus {
  initial,
  loading,
  success,
  error,
}

@immutable
final class HistoryState extends Equatable {
  const HistoryState({
    this.method = HistoryMethod.initial,
    this.status = HistoryStatus.initial,
    this.filteredHistory = const [],
    this.history = const [],
    this.exception,
  });

  final HistoryMethod method;
  final HistoryStatus status;
  final List<TranslationHistory> filteredHistory;
  final List<TranslationHistory> history;
  final Exception? exception;

  HistoryState loading() => HistoryState(
        status: HistoryStatus.loading,
        history: history,
      );

  HistoryState fetchSuccess(List<TranslationHistory> history) => HistoryState(
        status: HistoryStatus.success,
        history: history,
        filteredHistory: history,
      );

  HistoryState filterSuccess(
    List<TranslationHistory> filteredHistory,
    List<TranslationHistory> history,
  ) {
    return HistoryState(
      status: HistoryStatus.success,
      filteredHistory: filteredHistory,
      history: history,
    );
  }

  HistoryState error(Exception e) => HistoryState(
        status: HistoryStatus.error,
        history: history,
        exception: e,
      );

  @override
  List<Object?> get props =>
      [method, status, filteredHistory, history, exception];
}
