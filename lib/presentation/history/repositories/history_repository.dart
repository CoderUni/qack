import 'dart:isolate';

import 'package:qack/presentation/history/models/models.dart';
import 'package:qack/utils/database/database.dart'
    hide TranslationHistory, TranslationHistoryItem;

final class HistoryRepository {
  const HistoryRepository({
    required this.appDatabase,
  });

  final AppDatabase appDatabase;

  Future<List<TranslationHistory>> fetchTranslationHistory() async {
    final historyEntries = await appDatabase.fetchTranslationHistory().get();
    return Isolate.run(
      () async => historyEntries.map((entry) {
        return TranslationHistory(
          id: entry.id,
          timestamp: DateTime.parse(entry.createdAt),
          input: entry.input,
          items: TranslationHistoryItem.stringToList(
            entry.historyItems,
          ),
        );
      }).toList(),
    );
  }
}
