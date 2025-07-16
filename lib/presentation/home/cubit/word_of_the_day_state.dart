part of 'word_of_the_day_cubit.dart';

@immutable
sealed class WordOfTheDayState extends Equatable {
  const WordOfTheDayState(
    this.wordOfTheDay, {
    this.exception,
  });

  final WordOfTheDay? wordOfTheDay;
  final Exception? exception;

  @override
  List<Object?> get props => [wordOfTheDay, exception];
}

final class WordOfTheDayInitial extends WordOfTheDayState {
  const WordOfTheDayInitial() : super(null);
}

final class WordOfTheDayLoading extends WordOfTheDayState {
  const WordOfTheDayLoading() : super(null);
}

final class WordOfTheDaySuccess extends WordOfTheDayState {
  const WordOfTheDaySuccess(super.wordOfTheDay);

  WordOfTheDaySuccess copyWith({WordOfTheDay? wordOfTheDay}) {
    return WordOfTheDaySuccess(
      wordOfTheDay ?? this.wordOfTheDay!,
    );
  }
}

final class WordOfTheDayFailure extends WordOfTheDayState {
  const WordOfTheDayFailure(Exception e) : super(null, exception: e);
}
