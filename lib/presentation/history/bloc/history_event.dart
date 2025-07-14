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

final class HistoryFiltered extends HistoryEvent {
  const HistoryFiltered(this.query);
  final String query;

  @override
  List<Object?> get props => [query];
}

final class HistoryDeleted extends HistoryEvent {
  const HistoryDeleted(this.historyId);
  final int historyId;

  @override
  List<Object?> get props => [historyId];
}
