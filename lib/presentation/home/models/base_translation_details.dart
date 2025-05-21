import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qack/presentation/home/models/models.dart';
import 'package:qack/presentation/settings/models/models.dart';

/// Contains all the enabled translators and their translated output.
typedef TranslationDetails = Map<Translator, BaseTranslationDetails>;

enum TranslationStatus { initial, loading, success, error }

/// {@template base_translation_details}
/// Base class for translation details.
/// {@endtemplate}
abstract class BaseTranslationDetails extends Equatable {
  /// {@macro base_translation_details}
  const BaseTranslationDetails({
    required this.srcLanguage,
    required this.targetLanguage,
    required this.translatedText,
    required this.status,
    required this.exception,
  });

  /// Language code of the source text
  final String? srcLanguage;

  /// Language code of the target text
  final String? targetLanguage;

  /// {@macro translated_text}
  final TranslatedText? translatedText;

  /// Status of this certian translation
  @JsonKey(includeToJson: false, includeFromJson: false)
  final TranslationStatus status;

  /// Exception that occurred during translation
  @JsonKey(includeToJson: false, includeFromJson: false)
  final Exception? exception;

  @override
  List<Object?> get props =>
      [srcLanguage, targetLanguage, translatedText, status, exception];
}

/// {@template empty_translation_details}
/// BaseTranslationDetails with null values.
/// {@endtemplate}
class EmptyTranslationDetails extends BaseTranslationDetails {
  /// {@macro empty_translation_details}
  const EmptyTranslationDetails()
      : super(
          srcLanguage: null,
          targetLanguage: null,
          translatedText: null,
          status: TranslationStatus.initial,
          exception: null,
        );
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

extension BaseTranslationX on BaseTranslationDetails {
  /// Returns the name of the translator
  Translator get translatorName {
    if (this is BaiduTranslation) {
      return Translator.baidu;
    } else if (this is DeepseekChatCompletion) {
      return Translator.deepSeek;
    }
    return Translator.google;
  }

  /// Return svg path of the translator
  String get svgPath {
    if (this is BaiduTranslation) {
      return 'assets/images/baidu_icon.svg.vec';
    } else if (this is DeepseekChatCompletion) {
      return 'assets/images/deepseek_icon.svg.vec';
    }
    throw Exception('All cases in BaseTranslationDetaisl svgName extension '
        'are not matched.');
  }
}

extension BaseTranslationStringExtension on String {
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
