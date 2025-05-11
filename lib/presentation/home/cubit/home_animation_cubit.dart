import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_animation_state.dart';

class HomeAnimationCubit extends Cubit<HomeAnimationState> {
  HomeAnimationCubit() : super(HomeAnimationInitial());
}
