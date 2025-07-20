import 'package:qack/utils/database/database.dart';

final class DictionaryRepository {
  DictionaryRepository({
    required this.appDatabase,
  });

  final AppDatabase appDatabase;

  Future<List<DictionaryData>> fetchDictionaryEntries() async {
    // Fetch dictionary entries from the database
    return (appDatabase.select(appDatabase.dictionary)..limit(100)).get();
  }

  Future<List<DictionaryData>> queryDictionaryEntries(String query) async {
    final ftsQuery = '${query.trim()}*';
    final likeQuery =
        // ignore: lines_longer_than_80_chars
        '${query.trim().replaceAllMapped(RegExp(r'[\\%_]'), (m) => '\\${m[0]}')}%';

    final result = await appDatabase.queryDictionary(ftsQuery, likeQuery).get();

    if (result.isEmpty) return [];
    // Convert the result to TranslationHistory objects
    return result.map((entry) {
      return DictionaryData(
        id: entry.parentID,
        simplified: entry.simplified,
        traditional: entry.traditional,
        pinyin: entry.pinyin,
        definitions: entry.definitions,
        examples: entry.examples,
      );
    }).toList();
  }
}
