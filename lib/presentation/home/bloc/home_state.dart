part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeTextTranslateLoading extends HomeState {
  const HomeTextTranslateLoading();
}

final class HomeTextStateEmpty extends HomeState {
  const HomeTextStateEmpty();
}

final class HomeTextTranslateSuccess extends HomeState {
  const HomeTextTranslateSuccess({required this.translationDetails});

  final TranslationDetails translationDetails;

  @override
  List<Object> get props => [translationDetails];
}

final class HomeTextTranslateError extends HomeState {
  const HomeTextTranslateError({required this.exception});
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
