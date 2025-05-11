import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/constants/key_name_constants.dart';

final class SettingsRepository {
  SettingsRepository({required this.storage});
  final FlutterSecureStorage storage;

  // Get the deepl API key from the secure storage
  Future<String?> getDeepLAPIKey() async {
    try {
      return await storage.read(key: KeyNameConstants.deepLKeyName);
    } on Exception {
      rethrow;
    }
  }

  /// Save the deepl API key to the secure storage
  Future<void> saveDeepLAPIKey(String key) async {
    // Check if the key is empty
    if (key.isEmpty) {
      throw Exception('API key cannot be empty');
    }

    try {
      await storage.write(key: KeyNameConstants.deepLKeyName, value: key);
    } on Exception {
      rethrow;
    }
  }
}
