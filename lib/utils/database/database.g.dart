// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class TranslationHistory extends Table
    with TableInfo<TranslationHistory, TranslationHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TranslationHistory(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'createdAt', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _inputMeta = const VerificationMeta('input');
  late final GeneratedColumn<String> input = GeneratedColumn<String>(
      'input', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, input];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translationHistory';
  @override
  VerificationContext validateIntegrity(
      Insertable<TranslationHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('createdAt')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('input')) {
      context.handle(
          _inputMeta, input.isAcceptableOrUnknown(data['input']!, _inputMeta));
    } else if (isInserting) {
      context.missing(_inputMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TranslationHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslationHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}createdAt'])!,
      input: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}input'])!,
    );
  }

  @override
  TranslationHistory createAlias(String alias) {
    return TranslationHistory(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TranslationHistoryData extends DataClass
    implements Insertable<TranslationHistoryData> {
  final int id;
  final String createdAt;
  final String input;
  const TranslationHistoryData(
      {required this.id, required this.createdAt, required this.input});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['createdAt'] = Variable<String>(createdAt);
    map['input'] = Variable<String>(input);
    return map;
  }

  TranslationHistoryCompanion toCompanion(bool nullToAbsent) {
    return TranslationHistoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      input: Value(input),
    );
  }

  factory TranslationHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationHistoryData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      input: serializer.fromJson<String>(json['input']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<String>(createdAt),
      'input': serializer.toJson<String>(input),
    };
  }

  TranslationHistoryData copyWith(
          {int? id, String? createdAt, String? input}) =>
      TranslationHistoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        input: input ?? this.input,
      );
  TranslationHistoryData copyWithCompanion(TranslationHistoryCompanion data) {
    return TranslationHistoryData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      input: data.input.present ? data.input.value : this.input,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('input: $input')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, input);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationHistoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.input == this.input);
}

class TranslationHistoryCompanion
    extends UpdateCompanion<TranslationHistoryData> {
  final Value<int> id;
  final Value<String> createdAt;
  final Value<String> input;
  const TranslationHistoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.input = const Value.absent(),
  });
  TranslationHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String createdAt,
    required String input,
  })  : createdAt = Value(createdAt),
        input = Value(input);
  static Insertable<TranslationHistoryData> custom({
    Expression<int>? id,
    Expression<String>? createdAt,
    Expression<String>? input,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'createdAt': createdAt,
      if (input != null) 'input': input,
    });
  }

  TranslationHistoryCompanion copyWith(
      {Value<int>? id, Value<String>? createdAt, Value<String>? input}) {
    return TranslationHistoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      input: input ?? this.input,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<String>(createdAt.value);
    }
    if (input.present) {
      map['input'] = Variable<String>(input.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('input: $input')
          ..write(')'))
        .toString();
  }
}

class TranslationHistoryItem extends Table
    with TableInfo<TranslationHistoryItem, TranslationHistoryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TranslationHistoryItem(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _parentIDMeta =
      const VerificationMeta('parentID');
  late final GeneratedColumn<int> parentID = GeneratedColumn<int>(
      'parentID', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES translationHistory(id)');
  static const VerificationMeta _translatorMeta =
      const VerificationMeta('translator');
  late final GeneratedColumn<int> translator = GeneratedColumn<int>(
      'translator', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _outputMeta = const VerificationMeta('output');
  late final GeneratedColumn<String> output = GeneratedColumn<String>(
      'output', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, parentID, translator, output];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translationHistoryItem';
  @override
  VerificationContext validateIntegrity(
      Insertable<TranslationHistoryItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parentID')) {
      context.handle(_parentIDMeta,
          parentID.isAcceptableOrUnknown(data['parentID']!, _parentIDMeta));
    } else if (isInserting) {
      context.missing(_parentIDMeta);
    }
    if (data.containsKey('translator')) {
      context.handle(
          _translatorMeta,
          translator.isAcceptableOrUnknown(
              data['translator']!, _translatorMeta));
    } else if (isInserting) {
      context.missing(_translatorMeta);
    }
    if (data.containsKey('output')) {
      context.handle(_outputMeta,
          output.isAcceptableOrUnknown(data['output']!, _outputMeta));
    } else if (isInserting) {
      context.missing(_outputMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TranslationHistoryItemData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslationHistoryItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parentID'])!,
      translator: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}translator'])!,
      output: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}output'])!,
    );
  }

  @override
  TranslationHistoryItem createAlias(String alias) {
    return TranslationHistoryItem(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TranslationHistoryItemData extends DataClass
    implements Insertable<TranslationHistoryItemData> {
  final int id;
  final int parentID;
  final int translator;
  final String output;
  const TranslationHistoryItemData(
      {required this.id,
      required this.parentID,
      required this.translator,
      required this.output});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parentID'] = Variable<int>(parentID);
    map['translator'] = Variable<int>(translator);
    map['output'] = Variable<String>(output);
    return map;
  }

  TranslationHistoryItemCompanion toCompanion(bool nullToAbsent) {
    return TranslationHistoryItemCompanion(
      id: Value(id),
      parentID: Value(parentID),
      translator: Value(translator),
      output: Value(output),
    );
  }

  factory TranslationHistoryItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationHistoryItemData(
      id: serializer.fromJson<int>(json['id']),
      parentID: serializer.fromJson<int>(json['parentID']),
      translator: serializer.fromJson<int>(json['translator']),
      output: serializer.fromJson<String>(json['output']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentID': serializer.toJson<int>(parentID),
      'translator': serializer.toJson<int>(translator),
      'output': serializer.toJson<String>(output),
    };
  }

  TranslationHistoryItemData copyWith(
          {int? id, int? parentID, int? translator, String? output}) =>
      TranslationHistoryItemData(
        id: id ?? this.id,
        parentID: parentID ?? this.parentID,
        translator: translator ?? this.translator,
        output: output ?? this.output,
      );
  TranslationHistoryItemData copyWithCompanion(
      TranslationHistoryItemCompanion data) {
    return TranslationHistoryItemData(
      id: data.id.present ? data.id.value : this.id,
      parentID: data.parentID.present ? data.parentID.value : this.parentID,
      translator:
          data.translator.present ? data.translator.value : this.translator,
      output: data.output.present ? data.output.value : this.output,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryItemData(')
          ..write('id: $id, ')
          ..write('parentID: $parentID, ')
          ..write('translator: $translator, ')
          ..write('output: $output')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentID, translator, output);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationHistoryItemData &&
          other.id == this.id &&
          other.parentID == this.parentID &&
          other.translator == this.translator &&
          other.output == this.output);
}

class TranslationHistoryItemCompanion
    extends UpdateCompanion<TranslationHistoryItemData> {
  final Value<int> id;
  final Value<int> parentID;
  final Value<int> translator;
  final Value<String> output;
  const TranslationHistoryItemCompanion({
    this.id = const Value.absent(),
    this.parentID = const Value.absent(),
    this.translator = const Value.absent(),
    this.output = const Value.absent(),
  });
  TranslationHistoryItemCompanion.insert({
    this.id = const Value.absent(),
    required int parentID,
    required int translator,
    required String output,
  })  : parentID = Value(parentID),
        translator = Value(translator),
        output = Value(output);
  static Insertable<TranslationHistoryItemData> custom({
    Expression<int>? id,
    Expression<int>? parentID,
    Expression<int>? translator,
    Expression<String>? output,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentID != null) 'parentID': parentID,
      if (translator != null) 'translator': translator,
      if (output != null) 'output': output,
    });
  }

  TranslationHistoryItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? parentID,
      Value<int>? translator,
      Value<String>? output}) {
    return TranslationHistoryItemCompanion(
      id: id ?? this.id,
      parentID: parentID ?? this.parentID,
      translator: translator ?? this.translator,
      output: output ?? this.output,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentID.present) {
      map['parentID'] = Variable<int>(parentID.value);
    }
    if (translator.present) {
      map['translator'] = Variable<int>(translator.value);
    }
    if (output.present) {
      map['output'] = Variable<String>(output.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryItemCompanion(')
          ..write('id: $id, ')
          ..write('parentID: $parentID, ')
          ..write('translator: $translator, ')
          ..write('output: $output')
          ..write(')'))
        .toString();
  }
}

class TranslationHistoryItemFTS extends Table
    with
        TableInfo<TranslationHistoryItemFTS, TranslationHistoryItemFTSData>,
        VirtualTableInfo<TranslationHistoryItemFTS,
            TranslationHistoryItemFTSData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TranslationHistoryItemFTS(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _parentIDMeta =
      const VerificationMeta('parentID');
  late final GeneratedColumn<String> parentID = GeneratedColumn<String>(
      'parentID', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _translatorMeta =
      const VerificationMeta('translator');
  late final GeneratedColumn<String> translator = GeneratedColumn<String>(
      'translator', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [parentID, translator];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translationHistoryItemFTS';
  @override
  VerificationContext validateIntegrity(
      Insertable<TranslationHistoryItemFTSData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parentID')) {
      context.handle(_parentIDMeta,
          parentID.isAcceptableOrUnknown(data['parentID']!, _parentIDMeta));
    } else if (isInserting) {
      context.missing(_parentIDMeta);
    }
    if (data.containsKey('translator')) {
      context.handle(
          _translatorMeta,
          translator.isAcceptableOrUnknown(
              data['translator']!, _translatorMeta));
    } else if (isInserting) {
      context.missing(_translatorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TranslationHistoryItemFTSData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslationHistoryItemFTSData(
      parentID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parentID'])!,
      translator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translator'])!,
    );
  }

  @override
  TranslationHistoryItemFTS createAlias(String alias) {
    return TranslationHistoryItemFTS(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(parentID, translator)';
}

class TranslationHistoryItemFTSData extends DataClass
    implements Insertable<TranslationHistoryItemFTSData> {
  final String parentID;
  final String translator;
  const TranslationHistoryItemFTSData(
      {required this.parentID, required this.translator});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parentID'] = Variable<String>(parentID);
    map['translator'] = Variable<String>(translator);
    return map;
  }

  TranslationHistoryItemFTSCompanion toCompanion(bool nullToAbsent) {
    return TranslationHistoryItemFTSCompanion(
      parentID: Value(parentID),
      translator: Value(translator),
    );
  }

  factory TranslationHistoryItemFTSData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationHistoryItemFTSData(
      parentID: serializer.fromJson<String>(json['parentID']),
      translator: serializer.fromJson<String>(json['translator']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'parentID': serializer.toJson<String>(parentID),
      'translator': serializer.toJson<String>(translator),
    };
  }

  TranslationHistoryItemFTSData copyWith(
          {String? parentID, String? translator}) =>
      TranslationHistoryItemFTSData(
        parentID: parentID ?? this.parentID,
        translator: translator ?? this.translator,
      );
  TranslationHistoryItemFTSData copyWithCompanion(
      TranslationHistoryItemFTSCompanion data) {
    return TranslationHistoryItemFTSData(
      parentID: data.parentID.present ? data.parentID.value : this.parentID,
      translator:
          data.translator.present ? data.translator.value : this.translator,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryItemFTSData(')
          ..write('parentID: $parentID, ')
          ..write('translator: $translator')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(parentID, translator);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationHistoryItemFTSData &&
          other.parentID == this.parentID &&
          other.translator == this.translator);
}

class TranslationHistoryItemFTSCompanion
    extends UpdateCompanion<TranslationHistoryItemFTSData> {
  final Value<String> parentID;
  final Value<String> translator;
  final Value<int> rowid;
  const TranslationHistoryItemFTSCompanion({
    this.parentID = const Value.absent(),
    this.translator = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TranslationHistoryItemFTSCompanion.insert({
    required String parentID,
    required String translator,
    this.rowid = const Value.absent(),
  })  : parentID = Value(parentID),
        translator = Value(translator);
  static Insertable<TranslationHistoryItemFTSData> custom({
    Expression<String>? parentID,
    Expression<String>? translator,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (parentID != null) 'parentID': parentID,
      if (translator != null) 'translator': translator,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TranslationHistoryItemFTSCompanion copyWith(
      {Value<String>? parentID, Value<String>? translator, Value<int>? rowid}) {
    return TranslationHistoryItemFTSCompanion(
      parentID: parentID ?? this.parentID,
      translator: translator ?? this.translator,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (parentID.present) {
      map['parentID'] = Variable<String>(parentID.value);
    }
    if (translator.present) {
      map['translator'] = Variable<String>(translator.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryItemFTSCompanion(')
          ..write('parentID: $parentID, ')
          ..write('translator: $translator, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final TranslationHistory translationHistory = TranslationHistory(this);
  late final TranslationHistoryItem translationHistoryItem =
      TranslationHistoryItem(this);
  late final Index translationHistoryItemParentIDIndex = Index(
      'translationHistoryItemParentIDIndex',
      'CREATE INDEX translationHistoryItemParentIDIndex ON translationHistoryItem (parentID)');
  late final TranslationHistoryItemFTS translationHistoryItemFTS =
      TranslationHistoryItemFTS(this);
  Selectable<FetchTranslationHistoryResult> fetchTranslationHistory() {
    return customSelect(
        'SELECT th.id, th.createdAt, th.input, json_group_array(json_object(\'id\', thi.id, \'parentID\', thi.parentID, \'translator\', thi.translator, \'output\', thi.output)) AS historyItems FROM translationHistory AS th INNER JOIN translationHistoryItem AS thi ON th.id = thi.parentID GROUP BY th.id ORDER BY th.id DESC',
        variables: [],
        readsFrom: {
          translationHistory,
          translationHistoryItem,
        }).map((QueryRow row) => FetchTranslationHistoryResult(
          id: row.read<int>('id'),
          createdAt: row.read<String>('createdAt'),
          input: row.read<String>('input'),
          historyItems: row.read<String>('historyItems'),
        ));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        translationHistory,
        translationHistoryItem,
        translationHistoryItemParentIDIndex,
        translationHistoryItemFTS
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $TranslationHistoryCreateCompanionBuilder = TranslationHistoryCompanion
    Function({
  Value<int> id,
  required String createdAt,
  required String input,
});
typedef $TranslationHistoryUpdateCompanionBuilder = TranslationHistoryCompanion
    Function({
  Value<int> id,
  Value<String> createdAt,
  Value<String> input,
});

final class $TranslationHistoryReferences extends BaseReferences<_$AppDatabase,
    TranslationHistory, TranslationHistoryData> {
  $TranslationHistoryReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<TranslationHistoryItem,
      List<TranslationHistoryItemData>> _translationHistoryItemRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.translationHistoryItem,
          aliasName: $_aliasNameGenerator(
              db.translationHistory.id, db.translationHistoryItem.parentID));

  $TranslationHistoryItemProcessedTableManager get translationHistoryItemRefs {
    final manager =
        $TranslationHistoryItemTableManager($_db, $_db.translationHistoryItem)
            .filter((f) => f.parentID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_translationHistoryItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $TranslationHistoryFilterComposer
    extends Composer<_$AppDatabase, TranslationHistory> {
  $TranslationHistoryFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get input => $composableBuilder(
      column: $table.input, builder: (column) => ColumnFilters(column));

  Expression<bool> translationHistoryItemRefs(
      Expression<bool> Function($TranslationHistoryItemFilterComposer f) f) {
    final $TranslationHistoryItemFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.translationHistoryItem,
        getReferencedColumn: (t) => t.parentID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TranslationHistoryItemFilterComposer(
              $db: $db,
              $table: $db.translationHistoryItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $TranslationHistoryOrderingComposer
    extends Composer<_$AppDatabase, TranslationHistory> {
  $TranslationHistoryOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get input => $composableBuilder(
      column: $table.input, builder: (column) => ColumnOrderings(column));
}

class $TranslationHistoryAnnotationComposer
    extends Composer<_$AppDatabase, TranslationHistory> {
  $TranslationHistoryAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get input =>
      $composableBuilder(column: $table.input, builder: (column) => column);

  Expression<T> translationHistoryItemRefs<T extends Object>(
      Expression<T> Function($TranslationHistoryItemAnnotationComposer a) f) {
    final $TranslationHistoryItemAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.translationHistoryItem,
        getReferencedColumn: (t) => t.parentID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TranslationHistoryItemAnnotationComposer(
              $db: $db,
              $table: $db.translationHistoryItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $TranslationHistoryTableManager extends RootTableManager<
    _$AppDatabase,
    TranslationHistory,
    TranslationHistoryData,
    $TranslationHistoryFilterComposer,
    $TranslationHistoryOrderingComposer,
    $TranslationHistoryAnnotationComposer,
    $TranslationHistoryCreateCompanionBuilder,
    $TranslationHistoryUpdateCompanionBuilder,
    (TranslationHistoryData, $TranslationHistoryReferences),
    TranslationHistoryData,
    PrefetchHooks Function({bool translationHistoryItemRefs})> {
  $TranslationHistoryTableManager(_$AppDatabase db, TranslationHistory table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TranslationHistoryFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TranslationHistoryOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TranslationHistoryAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> input = const Value.absent(),
          }) =>
              TranslationHistoryCompanion(
            id: id,
            createdAt: createdAt,
            input: input,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String createdAt,
            required String input,
          }) =>
              TranslationHistoryCompanion.insert(
            id: id,
            createdAt: createdAt,
            input: input,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $TranslationHistoryReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({translationHistoryItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (translationHistoryItemRefs) db.translationHistoryItem
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (translationHistoryItemRefs)
                    await $_getPrefetchedData<TranslationHistoryData,
                            TranslationHistory, TranslationHistoryItemData>(
                        currentTable: table,
                        referencedTable: $TranslationHistoryReferences
                            ._translationHistoryItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $TranslationHistoryReferences(db, table, p0)
                                .translationHistoryItemRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.parentID == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $TranslationHistoryProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TranslationHistory,
    TranslationHistoryData,
    $TranslationHistoryFilterComposer,
    $TranslationHistoryOrderingComposer,
    $TranslationHistoryAnnotationComposer,
    $TranslationHistoryCreateCompanionBuilder,
    $TranslationHistoryUpdateCompanionBuilder,
    (TranslationHistoryData, $TranslationHistoryReferences),
    TranslationHistoryData,
    PrefetchHooks Function({bool translationHistoryItemRefs})>;
typedef $TranslationHistoryItemCreateCompanionBuilder
    = TranslationHistoryItemCompanion Function({
  Value<int> id,
  required int parentID,
  required int translator,
  required String output,
});
typedef $TranslationHistoryItemUpdateCompanionBuilder
    = TranslationHistoryItemCompanion Function({
  Value<int> id,
  Value<int> parentID,
  Value<int> translator,
  Value<String> output,
});

final class $TranslationHistoryItemReferences extends BaseReferences<
    _$AppDatabase, TranslationHistoryItem, TranslationHistoryItemData> {
  $TranslationHistoryItemReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static TranslationHistory _parentIDTable(_$AppDatabase db) =>
      db.translationHistory.createAlias($_aliasNameGenerator(
          db.translationHistoryItem.parentID, db.translationHistory.id));

  $TranslationHistoryProcessedTableManager get parentID {
    final $_column = $_itemColumn<int>('parentID')!;

    final manager =
        $TranslationHistoryTableManager($_db, $_db.translationHistory)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $TranslationHistoryItemFilterComposer
    extends Composer<_$AppDatabase, TranslationHistoryItem> {
  $TranslationHistoryItemFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get translator => $composableBuilder(
      column: $table.translator, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get output => $composableBuilder(
      column: $table.output, builder: (column) => ColumnFilters(column));

  $TranslationHistoryFilterComposer get parentID {
    final $TranslationHistoryFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentID,
        referencedTable: $db.translationHistory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TranslationHistoryFilterComposer(
              $db: $db,
              $table: $db.translationHistory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $TranslationHistoryItemOrderingComposer
    extends Composer<_$AppDatabase, TranslationHistoryItem> {
  $TranslationHistoryItemOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get translator => $composableBuilder(
      column: $table.translator, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get output => $composableBuilder(
      column: $table.output, builder: (column) => ColumnOrderings(column));

  $TranslationHistoryOrderingComposer get parentID {
    final $TranslationHistoryOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentID,
        referencedTable: $db.translationHistory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TranslationHistoryOrderingComposer(
              $db: $db,
              $table: $db.translationHistory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $TranslationHistoryItemAnnotationComposer
    extends Composer<_$AppDatabase, TranslationHistoryItem> {
  $TranslationHistoryItemAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get translator => $composableBuilder(
      column: $table.translator, builder: (column) => column);

  GeneratedColumn<String> get output =>
      $composableBuilder(column: $table.output, builder: (column) => column);

  $TranslationHistoryAnnotationComposer get parentID {
    final $TranslationHistoryAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentID,
        referencedTable: $db.translationHistory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TranslationHistoryAnnotationComposer(
              $db: $db,
              $table: $db.translationHistory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $TranslationHistoryItemTableManager extends RootTableManager<
    _$AppDatabase,
    TranslationHistoryItem,
    TranslationHistoryItemData,
    $TranslationHistoryItemFilterComposer,
    $TranslationHistoryItemOrderingComposer,
    $TranslationHistoryItemAnnotationComposer,
    $TranslationHistoryItemCreateCompanionBuilder,
    $TranslationHistoryItemUpdateCompanionBuilder,
    (TranslationHistoryItemData, $TranslationHistoryItemReferences),
    TranslationHistoryItemData,
    PrefetchHooks Function({bool parentID})> {
  $TranslationHistoryItemTableManager(
      _$AppDatabase db, TranslationHistoryItem table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TranslationHistoryItemFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TranslationHistoryItemOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TranslationHistoryItemAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parentID = const Value.absent(),
            Value<int> translator = const Value.absent(),
            Value<String> output = const Value.absent(),
          }) =>
              TranslationHistoryItemCompanion(
            id: id,
            parentID: parentID,
            translator: translator,
            output: output,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parentID,
            required int translator,
            required String output,
          }) =>
              TranslationHistoryItemCompanion.insert(
            id: id,
            parentID: parentID,
            translator: translator,
            output: output,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $TranslationHistoryItemReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({parentID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentID,
                    referencedTable:
                        $TranslationHistoryItemReferences._parentIDTable(db),
                    referencedColumn:
                        $TranslationHistoryItemReferences._parentIDTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $TranslationHistoryItemProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TranslationHistoryItem,
    TranslationHistoryItemData,
    $TranslationHistoryItemFilterComposer,
    $TranslationHistoryItemOrderingComposer,
    $TranslationHistoryItemAnnotationComposer,
    $TranslationHistoryItemCreateCompanionBuilder,
    $TranslationHistoryItemUpdateCompanionBuilder,
    (TranslationHistoryItemData, $TranslationHistoryItemReferences),
    TranslationHistoryItemData,
    PrefetchHooks Function({bool parentID})>;
typedef $TranslationHistoryItemFTSCreateCompanionBuilder
    = TranslationHistoryItemFTSCompanion Function({
  required String parentID,
  required String translator,
  Value<int> rowid,
});
typedef $TranslationHistoryItemFTSUpdateCompanionBuilder
    = TranslationHistoryItemFTSCompanion Function({
  Value<String> parentID,
  Value<String> translator,
  Value<int> rowid,
});

class $TranslationHistoryItemFTSFilterComposer
    extends Composer<_$AppDatabase, TranslationHistoryItemFTS> {
  $TranslationHistoryItemFTSFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get parentID => $composableBuilder(
      column: $table.parentID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translator => $composableBuilder(
      column: $table.translator, builder: (column) => ColumnFilters(column));
}

class $TranslationHistoryItemFTSOrderingComposer
    extends Composer<_$AppDatabase, TranslationHistoryItemFTS> {
  $TranslationHistoryItemFTSOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get parentID => $composableBuilder(
      column: $table.parentID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translator => $composableBuilder(
      column: $table.translator, builder: (column) => ColumnOrderings(column));
}

class $TranslationHistoryItemFTSAnnotationComposer
    extends Composer<_$AppDatabase, TranslationHistoryItemFTS> {
  $TranslationHistoryItemFTSAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get parentID =>
      $composableBuilder(column: $table.parentID, builder: (column) => column);

  GeneratedColumn<String> get translator => $composableBuilder(
      column: $table.translator, builder: (column) => column);
}

class $TranslationHistoryItemFTSTableManager extends RootTableManager<
    _$AppDatabase,
    TranslationHistoryItemFTS,
    TranslationHistoryItemFTSData,
    $TranslationHistoryItemFTSFilterComposer,
    $TranslationHistoryItemFTSOrderingComposer,
    $TranslationHistoryItemFTSAnnotationComposer,
    $TranslationHistoryItemFTSCreateCompanionBuilder,
    $TranslationHistoryItemFTSUpdateCompanionBuilder,
    (
      TranslationHistoryItemFTSData,
      BaseReferences<_$AppDatabase, TranslationHistoryItemFTS,
          TranslationHistoryItemFTSData>
    ),
    TranslationHistoryItemFTSData,
    PrefetchHooks Function()> {
  $TranslationHistoryItemFTSTableManager(
      _$AppDatabase db, TranslationHistoryItemFTS table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TranslationHistoryItemFTSFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TranslationHistoryItemFTSOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $TranslationHistoryItemFTSAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> parentID = const Value.absent(),
            Value<String> translator = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TranslationHistoryItemFTSCompanion(
            parentID: parentID,
            translator: translator,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String parentID,
            required String translator,
            Value<int> rowid = const Value.absent(),
          }) =>
              TranslationHistoryItemFTSCompanion.insert(
            parentID: parentID,
            translator: translator,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $TranslationHistoryItemFTSProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TranslationHistoryItemFTS,
    TranslationHistoryItemFTSData,
    $TranslationHistoryItemFTSFilterComposer,
    $TranslationHistoryItemFTSOrderingComposer,
    $TranslationHistoryItemFTSAnnotationComposer,
    $TranslationHistoryItemFTSCreateCompanionBuilder,
    $TranslationHistoryItemFTSUpdateCompanionBuilder,
    (
      TranslationHistoryItemFTSData,
      BaseReferences<_$AppDatabase, TranslationHistoryItemFTS,
          TranslationHistoryItemFTSData>
    ),
    TranslationHistoryItemFTSData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $TranslationHistoryTableManager get translationHistory =>
      $TranslationHistoryTableManager(_db, _db.translationHistory);
  $TranslationHistoryItemTableManager get translationHistoryItem =>
      $TranslationHistoryItemTableManager(_db, _db.translationHistoryItem);
  $TranslationHistoryItemFTSTableManager get translationHistoryItemFTS =>
      $TranslationHistoryItemFTSTableManager(
          _db, _db.translationHistoryItemFTS);
}

class FetchTranslationHistoryResult {
  final int id;
  final String createdAt;
  final String input;
  final String historyItems;
  FetchTranslationHistoryResult({
    required this.id,
    required this.createdAt,
    required this.input,
    required this.historyItems,
  });
}
