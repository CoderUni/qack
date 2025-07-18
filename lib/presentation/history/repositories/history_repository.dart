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

  Future<List<TranslationHistory>> filterHistory(
    List<TranslationHistory> history,
    String query,
  ) async {
    if (query.isEmpty) return history;

    final ftsQuery = '${query.trim()}*';
    final likeQuery =
        // ignore: lines_longer_than_80_chars
        '${query.trim().replaceAllMapped(RegExp(r'[\\%_]'), (m) => '\\${m[0]}')}%';

    final result =
        await appDatabase.queryTranslationHistory(ftsQuery, likeQuery).get();

    if (result.isEmpty) return [];
    // Convert the result to TranslationHistory objects
    return result.map((entry) {
      return TranslationHistory(
        id: entry.id,
        timestamp: DateTime.parse(entry.createdAt),
        input: entry.input,
        items: TranslationHistoryItem.stringToList(
          entry.historyItems,
        ),
      );
    }).toList();
  }
}
