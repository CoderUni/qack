part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState([
    this.translatorSettings,
  ]);

  final TranslatorSettings? translatorSettings;

  @override
  List<Object?> get props => [translatorSettings];
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

final class SettingsFetchLoading extends SettingsState {
  const SettingsFetchLoading();
}

final class SettingsFetchSuccess extends SettingsState {
  const SettingsFetchSuccess(super.translatorSettings);

  @override
  List<Object?> get props => [translatorSettings];
}

/// The existing api key is unchanged if a failure occurs.
final class SettingsFetchFailure extends SettingsState {
  const SettingsFetchFailure(this.exception);
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class SettingsEditTranslatorLoading extends SettingsState {
  const SettingsEditTranslatorLoading();
}

final class SettingsEditTranslatorSuccess extends SettingsState {
  const SettingsEditTranslatorSuccess(super.translatorSettings);

  @override
  List<Object?> get props => [translatorSettings];
}

/// Failed to save translator settings.
final class SettingsEditTranslatorFailure extends SettingsState {
  const SettingsEditTranslatorFailure(this.exception);
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
