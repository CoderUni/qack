part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object?> get props => [];
}

final class HistoryFetched extends HistoryEvent {
  const HistoryFetched();

  @override
  List<Object?> get props => [];
}

final class HistoryDeleted extends HistoryEvent {
  const HistoryDeleted(this.historyId);
  final int historyId;

  @override
  List<Object?> get props => [historyId];
}
