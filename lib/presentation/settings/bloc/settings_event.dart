part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsFetch extends SettingsEvent {
  const SettingsFetch();
}

final class SettingsEditTranslator extends SettingsEvent {
  const SettingsEditTranslator({
    required this.formKey,
    required this.enabledTranslators,
    required this.googleApiKey,
    required this.baiduAppID,
    required this.baiduSecretKey,
  });

  final GlobalKey<FormState> formKey;

  final List<TranslatorApp> enabledTranslators;

  // Google api keys
  final String? googleApiKey;

  // Baidu api keys
  final String? baiduAppID;
  final String? baiduSecretKey;

  @override
  List<Object> get props => [enabledTranslators];
}
