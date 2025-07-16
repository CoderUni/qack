import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qack/presentation/home/models/models.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';

part 'word_of_the_day_state.dart';

class WordOfTheDayCubit extends Cubit<WordOfTheDayState> {
  WordOfTheDayCubit(this.wordOfTheDayRepository, {required this.deepSeekApiKey})
      : super(const WordOfTheDayInitial());
  final WordOfTheDayRepository wordOfTheDayRepository;
  final String? deepSeekApiKey;

  Future<void> fetchWordOfTheDay() async {
    try {
      if (deepSeekApiKey != null && deepSeekApiKey!.isNotEmpty) {
        final wordOfTheDay =
            await wordOfTheDayRepository.fetchWordOfTheDay(deepSeekApiKey!);

        emit(WordOfTheDaySuccess(wordOfTheDay));
      }
    } on Exception catch (e) {
      emit(WordOfTheDayFailure(e));
    }
  }
}
