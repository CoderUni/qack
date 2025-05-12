import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(const HomeInitial()) {
    on<HomeTextChanged>(_onHomeTextChanged);
  }

  final HomeRepository homeRepository;

  Future<void> _onHomeTextChanged(
    HomeTextChanged event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(const HomeTextTranslateLoading());

      // TODO: call deepl translator here
      // Check if majority of the text is in English or Chinese
      // and then change the target_lang to the other language
      // Set source_lang manually if the auto-detect is not good
    } on Exception catch (e) {
      emit(HomeTextTranslateError(exception: e));
    }
  }
}
