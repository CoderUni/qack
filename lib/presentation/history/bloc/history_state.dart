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
    this.history = const [],
    this.exception,
  });

  final HistoryMethod method;
  final HistoryStatus status;
  final List<TranslationHistory> history;
  final Exception? exception;

  HistoryState loading() => HistoryState(
        status: HistoryStatus.loading,
        history: history,
      );

  HistoryState success(List<TranslationHistory> history) => HistoryState(
        status: HistoryStatus.success,
        history: history,
      );

  HistoryState error(Exception e) => HistoryState(
        status: HistoryStatus.error,
        history: history,
        exception: e,
      );

  @override
  List<Object?> get props => [method, status, history, exception];
}
