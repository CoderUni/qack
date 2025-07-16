import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/models/deepseek/deepseek_chat_completion.dart';

final class DeepseekTranslation extends BaseTranslationDetails {
  DeepseekTranslation(this.deepseekChatCompletion)
      : super(
          srcLanguage: 'auto',
          targetLanguage: 'auto',
          translatedText: TranslatedText(
            outputText:
                deepseekChatCompletion.choices.first.message.content ?? 'Error',
          ),
          status: _toTranslationStatus(deepseekChatCompletion.status),
          exception: deepseekChatCompletion.exception,
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
