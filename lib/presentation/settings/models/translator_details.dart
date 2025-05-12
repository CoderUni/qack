import 'package:freezed_annotation/freezed_annotation.dart';

part 'translator_details.freezed.dart';
part 'translator_details.g.dart';

// Once set, don't change the values since it will mess up the existing saved
// data in the secure storage.
enum TranslatorApp {
  google,
  baidu,
}

@freezed
abstract class TranslatorSettings with _$TranslatorSettings {
  factory TranslatorSettings({
    required List<TranslatorApp> enabledTranslators,
    required Map<String, String> apiKeys,
  }) = _TranslatorDetails;

  factory TranslatorSettings.fromJson(Map<String, dynamic> json) =>
      _$TranslatorDetailsFromJson(json);
}
