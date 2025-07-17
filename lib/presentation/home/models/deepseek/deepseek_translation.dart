import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/models/deepseek/deepseek_chat_completion.dart';

final class DeepSeekTranslation extends BaseTranslationDetails {
  DeepSeekTranslation(this.deepseekChatCompletion, {TranslationStatus? status})
      : super(
          srcLanguage: 'auto',
          targetLanguage: 'auto',
          translatedText: TranslatedText(
            outputText: deepseekChatCompletion.choices.isEmpty
                ? 'Empty response'
                : deepseekChatCompletion.choices.first.message.content ??
                    'Error',
          ),
          status: status ?? _toTranslationStatus(deepseekChatCompletion.status),
          exception: deepseekChatCompletion.exception,
        );

  DeepSeekTranslation.loading()
      : this(
          DeepseekChatCompletion.loading(),
          status: TranslationStatus.loading,
        );

  final DeepseekChatCompletion deepseekChatCompletion;

  static TranslationStatus _toTranslationStatus(DeepSeekStatus status) {
    switch (status) {
      case DeepSeekStatus.initial:
        return TranslationStatus.initial;
      case DeepSeekStatus.loading:
        return TranslationStatus.loading;
      case DeepSeekStatus.success:
        return TranslationStatus.success;
      case DeepSeekStatus.failure:
        return TranslationStatus.failure;
    }
  }
}
