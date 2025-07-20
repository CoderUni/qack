part of 'dictionary_bloc.dart';

enum DictionaryMethod {
  initial,
  fetchDictionary,
  queryDictionary,
}

enum DictionaryStatus {
  initial,
  loading,
  success,
  failure,
}

class DictionaryState extends Equatable {
  const DictionaryState({
    this.method = DictionaryMethod.initial,
    this.status = DictionaryStatus.initial,
    this.dictionaryEntries = const [],
  });

  final DictionaryMethod method;
  final DictionaryStatus status;
  final List<DictionaryData> dictionaryEntries;

  DictionaryState copyWith({
    DictionaryMethod? method,
    DictionaryStatus? status,
    List<DictionaryData>? dictionaryEntries,
  }) {
    return DictionaryState(
      method: method ?? this.method,
      status: status ?? this.status,
      dictionaryEntries: dictionaryEntries ?? this.dictionaryEntries,
    );
  }

  @override
  List<Object?> get props => [method, status, dictionaryEntries];
}
