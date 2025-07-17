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
    required this.youDaoAppID,
    required this.youDaoSecretKey,
    this.onTranslatorSettingsChanged,
  });

  final GlobalKey<FormState> formKey;

  final List<Translator> enabledTranslators;

  /// Callback to notify when the translator settings are changed.
  /// This is used to update the UI in other pages that rely on
  /// the translator settings.
  final void Function(List<Translator>)? onTranslatorSettingsChanged;

  // Google api keys
  final String? googleApiKey;

  // Baidu api keys
  final String? baiduAppID;
  final String? baiduSecretKey;

  // DeepSeek api keys
  final String? deepSeekApiKey;

  // YouDao api keys
  final String? youDaoAppID;
  final String? youDaoSecretKey;

  @override
  List<Object?> get props => [
        formKey,
        enabledTranslators,
        googleApiKey,
        baiduAppID,
        baiduSecretKey,
        deepSeekApiKey,
        youDaoAppID,
        youDaoSecretKey,
      ];
}
