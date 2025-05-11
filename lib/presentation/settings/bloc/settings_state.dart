part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState([
    this.deepLApiKey,
  ]);

  final String? deepLApiKey;

  @override
  List<Object?> get props => [deepLApiKey];
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

final class SettingsFetchLoading extends SettingsState {
  const SettingsFetchLoading();
}

final class SettingsFetchSuccess extends SettingsState {
  const SettingsFetchSuccess(super.deepLApiKey);

  @override
  List<Object?> get props => [deepLApiKey];
}

/// The existing api key is unchanged if a failure occurs.
final class SettingsFetchFailure extends SettingsState {
  const SettingsFetchFailure(this.exception);
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
