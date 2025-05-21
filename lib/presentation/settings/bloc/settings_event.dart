part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

final class SettingsFetch extends SettingsEvent {
  const SettingsFetch([this.translatorSettings]);
  final TranslatorSettings? translatorSettings;

  @override
  List<Object?> get props => [translatorSettings];
}

final class SettingsEditTranslator extends SettingsEvent {
  const SettingsEditTranslator({
    required this.formKey,
    required this.enabledTranslators,
    required this.googleApiKey,
    required this.baiduAppID,
    required this.baiduSecretKey,
    required this.deepSeekApiKey,
  });

  final GlobalKey<FormState> formKey;

  final List<Translator> enabledTranslators;

  // Google api keys
  final String? googleApiKey;

  // Baidu api keys
  final String? baiduAppID;
  final String? baiduSecretKey;

  // DeepSeek api keys
  final String? deepSeekApiKey;

  @override
  List<Object?> get props => [
        formKey,
        enabledTranslators,
        googleApiKey,
        baiduAppID,
        baiduSecretKey,
        deepSeekApiKey,
      ];
}
