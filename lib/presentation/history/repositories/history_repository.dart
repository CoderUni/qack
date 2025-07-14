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

  List<TranslationHistory> filterHistory(
    List<TranslationHistory> history,
    String query,
  ) {
    if (query.isEmpty) return history;

    final queryLower = query.toLowerCase().trim();

    final matchingInput = history.where((entry) {
      final inputLower = entry.input.toLowerCase();
      return inputLower.contains(queryLower);
    }).toList();

    // Include entries where any translation output matches the query
    // TODO: Rank the outputs based on how well the output matches the query
    final matchingOutput = history.where((entry) {
      // ignore: omit_local_variable_types
      for (final TranslationHistoryItem item in entry.items ?? []) {
        if (item.output.toLowerCase().contains(queryLower)) {
          return true;
        }
      }
      return false;
    }).toList();

    return <TranslationHistory>{...matchingInput, ...matchingOutput}.toList();
  }
}
