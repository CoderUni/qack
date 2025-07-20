part of 'dictionary_bloc.dart';

class DictionaryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DictionaryFetched extends DictionaryEvent {
  @override
  List<Object?> get props => [];
}

class DictionaryQueried extends DictionaryEvent {
  DictionaryQueried(this.query);
  final String query;
  @override
  List<Object?> get props => [query];
}
