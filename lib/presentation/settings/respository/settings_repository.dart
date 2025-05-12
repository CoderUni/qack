import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qack/constants/key_name_constants.dart';
import 'package:qack/presentation/settings/models/translator_details.dart';

final class SettingsRepository {
  SettingsRepository({required this.storage});
  final FlutterSecureStorage storage;

  // Get the translator API key from the secure storage
  Future<TranslatorSettings?> getAPIKey() async {
    try {
      final data = await storage.read(key: KeyNameConstants.translator);

      if (data == null || data.isEmpty) {
        return null;
      }

      return TranslatorSettings.fromJson(
        jsonDecode(data) as Map<String, dynamic>,
      );
    } on Exception {
      rethrow;
    }
  }

  /// Save the API key to the secure storage
  Future<void> saveAPIKey({
    required TranslatorSettings translatorSettings,
  }) async {
    try {
      await storage.write(
        key: KeyNameConstants.translator,
        value: jsonEncode(translatorSettings),
      );
    } on Exception {
      rethrow;
    }
  }
}
