part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  empty,
  success,
  error,
}

@immutable
final class HomeState extends Equatable {
  const HomeState(TranslationDetails details)
      : this._(translationDetails: details);

  const HomeState._({
    required this.translationDetails,
    this.status = HomeStatus.initial,
    this.exception,
  });
  final TranslationDetails translationDetails;

  final HomeStatus status;
  final Exception? exception;

  HomeState loading() => HomeState._(
        translationDetails: translationDetails,
        status: HomeStatus.loading,
      );

  HomeState empty() => HomeState._(
        translationDetails: translationDetails,
        status: HomeStatus.empty,
      );

  HomeState success(TranslationDetails details) => HomeState._(
        translationDetails: details,
        status: HomeStatus.success,
      );

  /// This error is a general error in [HomeRepository]'s translateText method.
  /// It is not a translation error.
  /// See [BaseTranslationError] for translation errors.
  HomeState failure(Exception e) => HomeState._(
        translationDetails: translationDetails,
        status: HomeStatus.error,
        exception: e,
      );

  @override
  List<Object?> get props => [translationDetails, status, exception];
}
