abstract class LinkConstants {
  const LinkConstants();

  /// Base URL for the DeepL API
  static const String deepLBaseUrl = 'https://api.deepl.com/$deeplAPIVersion';
  
  /// Version of the DeepL API
  static const String deeplAPIVersion = 'v2';

  /// Translation Endpoint for the DeepL API
  static const String deeplTranslateUrl = '$deepLBaseUrl/translate';
}
