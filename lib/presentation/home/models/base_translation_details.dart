import 'package:equatable/equatable.dart';
import 'package:qack/presentation/home/models/models.dart';

/// Contains all the enabled translators and their translated output.
typedef TranslationDetails = Map<String, BaseTranslationDetails>;

/// {@template base_translation_details}
/// Base class for translation details.
/// {@endtemplate}
abstract class BaseTranslationDetails extends Equatable {
  /// {@macro base_translation_details}
  const BaseTranslationDetails({
    required this.srcLanguage,
    required this.targetLanguage,
    required this.translatedText,
  });

  /// Language code of the source text
  final String? srcLanguage;

  /// Language code of the target text
  final String? targetLanguage;

  /// {@macro translated_text}
  final TranslatedText translatedText;

  @override
  List<Object?> get props => [srcLanguage, targetLanguage, translatedText];
}

/// {@template base_translation_error}
/// Base class for translation errors.
/// {@endtemplate}
abstract class BaseTranslationError extends Equatable implements Exception {
  /// {@macro base_translation_error}
  const BaseTranslationError({
    required this.errorMessage,
  });

  /// Error message
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

/// {@template translated_text}
/// Contains the translated input and output text.
/// {@endtemplate}
final class TranslatedText extends Equatable {
  /// {@macro translated_text}
  const TranslatedText({
    required this.outputText,
    this.inputText,
  });

  /// Input text to be translated
  final String? inputText;

  /// Translated text
  final String outputText;

  @override
  List<Object?> get props => [inputText, outputText];
}

extension BaseTranslationExtension on BaseTranslationDetails {
  /// Returns the name of the translator
  String get translatorName {
    if (this is BaiduTranslation) {
      return 'Baidu';
    } else if (this is DeepseekChatCompletion) {
      return 'Deepseek';
    }
    return 'Unknown';
  }
}

extension BaseTranslationStringExtension on String{
  /// Returns the name of the translator
  String get translatorName {
    if (this == 'Baidu') {
      return 'Baidu';
    } else if (this == 'Deepseek') {
      return 'Deepseek';
    }
    return 'Unknown';
  }
}
