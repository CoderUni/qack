part of 'home_bloc.dart';

enum HomeMethod {
  initial,
  textCleared,
  textChanged,
  settingsApiKeyRemoved,
}

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
    this.method = HomeMethod.initial,
    this.status = HomeStatus.initial,
    this.exception,
  });
  final TranslationDetails translationDetails;

  final HomeMethod method;
  final HomeStatus status;
  final Exception? exception;

  HomeState loading({required HomeMethod method}) => HomeState._(
        translationDetails: translationDetails,
        method: method,
        status: HomeStatus.loading,
      );

  HomeState empty({required HomeMethod method}) => HomeState._(
        translationDetails: translationDetails,
        method: method,
        status: HomeStatus.empty,
      );

  HomeState success(TranslationDetails details, {required HomeMethod method}) =>
      HomeState._(
        translationDetails: details,
        method: method,
        status: HomeStatus.success,
      );

  /// This error is a general error in [HomeRepository]'s translateText method.
  /// It is not a translation error.
  /// See [BaseTranslationError] for translation errors.
  HomeState failure(Exception e, {required HomeMethod method}) => HomeState._(
        translationDetails: translationDetails,
        method: method,
        status: HomeStatus.error,
        exception: e,
      );

  HomeState copyWith({
    TranslationDetails? translationDetails,
    HomeMethod? method,
    HomeStatus? status,
    Exception? exception,
  }) {
    return HomeState._(
      translationDetails: translationDetails ?? this.translationDetails,
      method: method ?? this.method,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [translationDetails, method, status, exception];
}
