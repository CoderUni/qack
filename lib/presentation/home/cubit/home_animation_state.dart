part of 'home_animation_cubit.dart';

sealed class HomeAnimationState extends Equatable {
  const HomeAnimationState();

  @override
  List<Object> get props => [];
}

final class HomeAnimationInitial extends HomeAnimationState {}
