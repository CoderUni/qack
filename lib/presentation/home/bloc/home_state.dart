part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState([this.translationDetails = const {}]);
  final TranslationDetails translationDetails;

  @override
  List<Object?> get props => [translationDetails];
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
  const HomeTextTranslateSuccess(super.translationDetails);
}

final class HomeTextTranslateError extends HomeState {
  const HomeTextTranslateError({required this.exception});
  // TODO: Add which translator got the error
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
