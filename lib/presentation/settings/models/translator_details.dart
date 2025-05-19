import 'package:freezed_annotation/freezed_annotation.dart';

part 'translator_details.freezed.dart';
part 'translator_details.g.dart';

// Once set, don't change the values since it will mess up the existing saved
// data in the secure storage.
enum Translator {
  google,
  baidu,
  deepSeek,
}

typedef TranslatorApiKeys = Map<String, String>;

@freezed
abstract class TranslatorSettings with _$TranslatorSettings {
  factory TranslatorSettings({
    required List<Translator> enabledTranslators,
    required TranslatorApiKeys apiKeys,
  }) = _TranslatorDetails;

  factory TranslatorSettings.fromJson(Map<String, dynamic> json) =>
      _$TranslatorDetailsFromJson(json);
}

extension TranslatorSettingsX on Translator {
  /// Return svg name of the translator
  String get svgPath {
    switch (this) {
      case Translator.google:
        return 'assets/images/google_icon.svg.vec';
      case Translator.baidu:
        return 'assets/images/baidu_icon.svg.vec';
      case Translator.deepSeek:
        return 'assets/images/deepseek_icon.svg.vec';
    }
  }
}
