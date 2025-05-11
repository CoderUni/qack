part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeTextChanged extends HomeEvent {
  const HomeTextChanged({required this.sourceText});

  final String sourceText;

    @override
  List<Object?> get props => [sourceText];
}
