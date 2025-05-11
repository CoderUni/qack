part of 'home_bloc.dart';

enum HomeMethod {
  initial,
  homeLoad,
}

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

@immutable
sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeTextTranslateLoading extends HomeState {
  const HomeTextTranslateLoading();
}

final class HomeTextTranslateSuccess extends HomeState {
  const HomeTextTranslateSuccess({required this.translatedText});

  final String translatedText;
}

final class HomeTextTranslateError extends HomeState {
  const HomeTextTranslateError({required this.exception});
  final Exception exception;
}
