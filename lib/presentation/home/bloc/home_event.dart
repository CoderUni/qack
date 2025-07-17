part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeTextCleared extends HomeEvent {
  const HomeTextCleared({required this.textController});
  final TextEditingController textController;

  @override
  List<Object?> get props => [textController];
}

final class HomeTextChanged extends HomeEvent {
  const HomeTextChanged({required this.sourceText});

  final String sourceText;

  @override
  List<Object?> get props => [sourceText];
}

final class HomeTranslatorRemoved extends HomeEvent {
  const HomeTranslatorRemoved(this.removedTranslators);

  /// List of translators whose API keys were removed from the settings.
  final List<Translator> removedTranslators;

  @override
  List<Object?> get props => [removedTranslators];
}
