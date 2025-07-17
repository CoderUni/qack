import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qack/presentation/home/models/models.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';

part 'word_of_the_day_state.dart';

class WordOfTheDayCubit extends Cubit<WordOfTheDayState> {
  WordOfTheDayCubit(this.wordOfTheDayRepository)
      : super(const WordOfTheDayInitial());
  final WordOfTheDayRepository wordOfTheDayRepository;

  Future<void> fetch(String deepSeekApiKey) async {
    try {
      final wordOfTheDay =
          await wordOfTheDayRepository.fetchWordOfTheDay(deepSeekApiKey);

      emit(WordOfTheDaySuccess(wordOfTheDay));
    } on Exception catch (e) {
      emit(WordOfTheDayFailure(e));
    }
  }
}
