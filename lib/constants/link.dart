abstract class LinkConstants {
  const LinkConstants();

  /// Base URL for the DeepL API
  static const String deepLBaseUrl = 'https://api.deepl.com/$deeplAPIVersion';

  /// Version of the DeepL API
  static const String deeplAPIVersion = 'v2';

  /// Translation Endpoint for the DeepL API
  static const String deeplTranslateUrl = '$deepLBaseUrl/translate';

  /// Base URL for the Baidu Translate API
  static const String baiduTranslateBaseUrl = 'https://api.fanyi.baidu.com/api';

  /// Translation Endpoint for the Baidu Translate API
  static const String baiduTranslateTranslationUrl =
      '$baiduTranslateBaseUrl/trans/vip/translate';

  static const String deepSeekBaseUrl = 'https://api.deepseek.com/v1';

  static const String deepSeekChatCompletionUrl =
      '$deepSeekBaseUrl/chat/completions';
}
