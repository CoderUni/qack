import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  include: {'tables.drift'},
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor?? _openConnection());

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
