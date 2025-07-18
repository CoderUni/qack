import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  include: {'tables.drift'},
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection()) {
    // Load the dictionary if it is empty
    loadDictionary(this);
  }

  @override
  int get schemaVersion => 1;
}

//TODO: Add migrations

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'drift_database',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}

Future<void> loadDictionary(AppDatabase db) async {
  final isTableEmpty = await db.checkIfDictionaryisEmpty().getSingle();

  if (isTableEmpty) {
    final csvRaw = await rootBundle.loadString('assets/dict.csv');
    final lines = const LineSplitter().convert(csvRaw);

    for (final line in lines) {
      final fields = line.split(',');

      if (fields.length < 4) continue; // skip malformed rows

      final simplified = fields.elementAt(0).trim().replaceAll('"', '');
      final traditional = fields.elementAt(1).trim().replaceAll('"', '');
      final pinyin = fields.elementAt(2).trim().replaceAll('"', '');
      final definitions = fields.elementAt(3).trim().replaceAll('"', '');
      var exampleSentences = '';
      if (fields.length > 4) {
        exampleSentences = fields.elementAt(4).trim().replaceAll('"', '');
      }

      await db.into(db.dictionary).insert(
            DictionaryCompanion(
              simplified: Value(simplified),
              traditional: Value(traditional),
              pinyin: Value(pinyin),
              definitions: Value(definitions),
              examples: Value(exampleSentences),
            ),
          );
    }
  }
}
