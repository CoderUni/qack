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
      $customConstraints:
          'NOT NULL REFERENCES translationHistory(id)ON DELETE CASCADE');
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

class TranslationHistoryFTS extends Table
    with
        TableInfo<TranslationHistoryFTS, TranslationHistoryFTSData>,
        VirtualTableInfo<TranslationHistoryFTS, TranslationHistoryFTSData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TranslationHistoryFTS(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _inputMeta = const VerificationMeta('input');
  late final GeneratedColumn<String> input = GeneratedColumn<String>(
      'input', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [input];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translationHistoryFTS';
  @override
  VerificationContext validateIntegrity(
      Insertable<TranslationHistoryFTSData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('input')) {
      context.handle(
          _inputMeta, input.isAcceptableOrUnknown(data['input']!, _inputMeta));
    } else if (isInserting) {
      context.missing(_inputMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TranslationHistoryFTSData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslationHistoryFTSData(
      input: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}input'])!,
    );
  }

  @override
  TranslationHistoryFTS createAlias(String alias) {
    return TranslationHistoryFTS(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(input, content=\'translationHistory\', content_rowid=\'id\', tokenize = \'unicode61 remove_diacritics 2\')';
}

class TranslationHistoryFTSData extends DataClass
    implements Insertable<TranslationHistoryFTSData> {
  final String input;
  const TranslationHistoryFTSData({required this.input});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['input'] = Variable<String>(input);
    return map;
  }

  TranslationHistoryFTSCompanion toCompanion(bool nullToAbsent) {
    return TranslationHistoryFTSCompanion(
      input: Value(input),
    );
  }

  factory TranslationHistoryFTSData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationHistoryFTSData(
      input: serializer.fromJson<String>(json['input']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'input': serializer.toJson<String>(input),
    };
  }

  TranslationHistoryFTSData copyWith({String? input}) =>
      TranslationHistoryFTSData(
        input: input ?? this.input,
      );
  TranslationHistoryFTSData copyWithCompanion(
      TranslationHistoryFTSCompanion data) {
    return TranslationHistoryFTSData(
      input: data.input.present ? data.input.value : this.input,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryFTSData(')
          ..write('input: $input')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => input.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationHistoryFTSData && other.input == this.input);
}

class TranslationHistoryFTSCompanion
    extends UpdateCompanion<TranslationHistoryFTSData> {
  final Value<String> input;
  final Value<int> rowid;
  const TranslationHistoryFTSCompanion({
    this.input = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TranslationHistoryFTSCompanion.insert({
    required String input,
    this.rowid = const Value.absent(),
  }) : input = Value(input);
  static Insertable<TranslationHistoryFTSData> custom({
    Expression<String>? input,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (input != null) 'input': input,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TranslationHistoryFTSCompanion copyWith(
      {Value<String>? input, Value<int>? rowid}) {
    return TranslationHistoryFTSCompanion(
      input: input ?? this.input,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (input.present) {
      map['input'] = Variable<String>(input.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryFTSCompanion(')
          ..write('input: $input, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _outputMeta = const VerificationMeta('output');
  late final GeneratedColumn<String> output = GeneratedColumn<String>(
      'output', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [output];
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
    if (data.containsKey('output')) {
      context.handle(_outputMeta,
          output.isAcceptableOrUnknown(data['output']!, _outputMeta));
    } else if (isInserting) {
      context.missing(_outputMeta);
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
      output: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}output'])!,
    );
  }

  @override
  TranslationHistoryItemFTS createAlias(String alias) {
    return TranslationHistoryItemFTS(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(output, content=\'translationHistoryItem\', content_rowid=\'id\', tokenize = \'unicode61 remove_diacritics 2\')';
}

class TranslationHistoryItemFTSData extends DataClass
    implements Insertable<TranslationHistoryItemFTSData> {
  final String output;
  const TranslationHistoryItemFTSData({required this.output});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['output'] = Variable<String>(output);
    return map;
  }

  TranslationHistoryItemFTSCompanion toCompanion(bool nullToAbsent) {
    return TranslationHistoryItemFTSCompanion(
      output: Value(output),
    );
  }

  factory TranslationHistoryItemFTSData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationHistoryItemFTSData(
      output: serializer.fromJson<String>(json['output']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'output': serializer.toJson<String>(output),
    };
  }

  TranslationHistoryItemFTSData copyWith({String? output}) =>
      TranslationHistoryItemFTSData(
        output: output ?? this.output,
      );
  TranslationHistoryItemFTSData copyWithCompanion(
      TranslationHistoryItemFTSCompanion data) {
    return TranslationHistoryItemFTSData(
      output: data.output.present ? data.output.value : this.output,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryItemFTSData(')
          ..write('output: $output')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => output.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationHistoryItemFTSData && other.output == this.output);
}

class TranslationHistoryItemFTSCompanion
    extends UpdateCompanion<TranslationHistoryItemFTSData> {
  final Value<String> output;
  final Value<int> rowid;
  const TranslationHistoryItemFTSCompanion({
    this.output = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TranslationHistoryItemFTSCompanion.insert({
    required String output,
    this.rowid = const Value.absent(),
  }) : output = Value(output);
  static Insertable<TranslationHistoryItemFTSData> custom({
    Expression<String>? output,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (output != null) 'output': output,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TranslationHistoryItemFTSCompanion copyWith(
      {Value<String>? output, Value<int>? rowid}) {
    return TranslationHistoryItemFTSCompanion(
      output: output ?? this.output,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (output.present) {
      map['output'] = Variable<String>(output.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationHistoryItemFTSCompanion(')
          ..write('output: $output, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Dictionary extends Table with TableInfo<Dictionary, DictionaryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Dictionary(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _simplifiedMeta =
      const VerificationMeta('simplified');
  late final GeneratedColumn<String> simplified = GeneratedColumn<String>(
      'simplified', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _traditionalMeta =
      const VerificationMeta('traditional');
  late final GeneratedColumn<String> traditional = GeneratedColumn<String>(
      'traditional', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _pinyinMeta = const VerificationMeta('pinyin');
  late final GeneratedColumn<String> pinyin = GeneratedColumn<String>(
      'pinyin', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _definitionsMeta =
      const VerificationMeta('definitions');
  late final GeneratedColumn<String> definitions = GeneratedColumn<String>(
      'definitions', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _examplesMeta =
      const VerificationMeta('examples');
  late final GeneratedColumn<String> examples = GeneratedColumn<String>(
      'examples', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [id, simplified, traditional, pinyin, definitions, examples];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionary';
  @override
  VerificationContext validateIntegrity(Insertable<DictionaryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('simplified')) {
      context.handle(
          _simplifiedMeta,
          simplified.isAcceptableOrUnknown(
              data['simplified']!, _simplifiedMeta));
    } else if (isInserting) {
      context.missing(_simplifiedMeta);
    }
    if (data.containsKey('traditional')) {
      context.handle(
          _traditionalMeta,
          traditional.isAcceptableOrUnknown(
              data['traditional']!, _traditionalMeta));
    } else if (isInserting) {
      context.missing(_traditionalMeta);
    }
    if (data.containsKey('pinyin')) {
      context.handle(_pinyinMeta,
          pinyin.isAcceptableOrUnknown(data['pinyin']!, _pinyinMeta));
    } else if (isInserting) {
      context.missing(_pinyinMeta);
    }
    if (data.containsKey('definitions')) {
      context.handle(
          _definitionsMeta,
          definitions.isAcceptableOrUnknown(
              data['definitions']!, _definitionsMeta));
    } else if (isInserting) {
      context.missing(_definitionsMeta);
    }
    if (data.containsKey('examples')) {
      context.handle(_examplesMeta,
          examples.isAcceptableOrUnknown(data['examples']!, _examplesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DictionaryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionaryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      simplified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}simplified'])!,
      traditional: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}traditional'])!,
      pinyin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pinyin'])!,
      definitions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definitions'])!,
      examples: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}examples']),
    );
  }

  @override
  Dictionary createAlias(String alias) {
    return Dictionary(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DictionaryData extends DataClass implements Insertable<DictionaryData> {
  final int id;
  final String simplified;
  final String traditional;
  final String pinyin;
  final String definitions;

  /// definitions separated by ;
  final String? examples;
  const DictionaryData(
      {required this.id,
      required this.simplified,
      required this.traditional,
      required this.pinyin,
      required this.definitions,
      this.examples});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['simplified'] = Variable<String>(simplified);
    map['traditional'] = Variable<String>(traditional);
    map['pinyin'] = Variable<String>(pinyin);
    map['definitions'] = Variable<String>(definitions);
    if (!nullToAbsent || examples != null) {
      map['examples'] = Variable<String>(examples);
    }
    return map;
  }

  DictionaryCompanion toCompanion(bool nullToAbsent) {
    return DictionaryCompanion(
      id: Value(id),
      simplified: Value(simplified),
      traditional: Value(traditional),
      pinyin: Value(pinyin),
      definitions: Value(definitions),
      examples: examples == null && nullToAbsent
          ? const Value.absent()
          : Value(examples),
    );
  }

  factory DictionaryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryData(
      id: serializer.fromJson<int>(json['id']),
      simplified: serializer.fromJson<String>(json['simplified']),
      traditional: serializer.fromJson<String>(json['traditional']),
      pinyin: serializer.fromJson<String>(json['pinyin']),
      definitions: serializer.fromJson<String>(json['definitions']),
      examples: serializer.fromJson<String?>(json['examples']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'simplified': serializer.toJson<String>(simplified),
      'traditional': serializer.toJson<String>(traditional),
      'pinyin': serializer.toJson<String>(pinyin),
      'definitions': serializer.toJson<String>(definitions),
      'examples': serializer.toJson<String?>(examples),
    };
  }

  DictionaryData copyWith(
          {int? id,
          String? simplified,
          String? traditional,
          String? pinyin,
          String? definitions,
          Value<String?> examples = const Value.absent()}) =>
      DictionaryData(
        id: id ?? this.id,
        simplified: simplified ?? this.simplified,
        traditional: traditional ?? this.traditional,
        pinyin: pinyin ?? this.pinyin,
        definitions: definitions ?? this.definitions,
        examples: examples.present ? examples.value : this.examples,
      );
  DictionaryData copyWithCompanion(DictionaryCompanion data) {
    return DictionaryData(
      id: data.id.present ? data.id.value : this.id,
      simplified:
          data.simplified.present ? data.simplified.value : this.simplified,
      traditional:
          data.traditional.present ? data.traditional.value : this.traditional,
      pinyin: data.pinyin.present ? data.pinyin.value : this.pinyin,
      definitions:
          data.definitions.present ? data.definitions.value : this.definitions,
      examples: data.examples.present ? data.examples.value : this.examples,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryData(')
          ..write('id: $id, ')
          ..write('simplified: $simplified, ')
          ..write('traditional: $traditional, ')
          ..write('pinyin: $pinyin, ')
          ..write('definitions: $definitions, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, simplified, traditional, pinyin, definitions, examples);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionaryData &&
          other.id == this.id &&
          other.simplified == this.simplified &&
          other.traditional == this.traditional &&
          other.pinyin == this.pinyin &&
          other.definitions == this.definitions &&
          other.examples == this.examples);
}

class DictionaryCompanion extends UpdateCompanion<DictionaryData> {
  final Value<int> id;
  final Value<String> simplified;
  final Value<String> traditional;
  final Value<String> pinyin;
  final Value<String> definitions;
  final Value<String?> examples;
  const DictionaryCompanion({
    this.id = const Value.absent(),
    this.simplified = const Value.absent(),
    this.traditional = const Value.absent(),
    this.pinyin = const Value.absent(),
    this.definitions = const Value.absent(),
    this.examples = const Value.absent(),
  });
  DictionaryCompanion.insert({
    this.id = const Value.absent(),
    required String simplified,
    required String traditional,
    required String pinyin,
    required String definitions,
    this.examples = const Value.absent(),
  })  : simplified = Value(simplified),
        traditional = Value(traditional),
        pinyin = Value(pinyin),
        definitions = Value(definitions);
  static Insertable<DictionaryData> custom({
    Expression<int>? id,
    Expression<String>? simplified,
    Expression<String>? traditional,
    Expression<String>? pinyin,
    Expression<String>? definitions,
    Expression<String>? examples,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (simplified != null) 'simplified': simplified,
      if (traditional != null) 'traditional': traditional,
      if (pinyin != null) 'pinyin': pinyin,
      if (definitions != null) 'definitions': definitions,
      if (examples != null) 'examples': examples,
    });
  }

  DictionaryCompanion copyWith(
      {Value<int>? id,
      Value<String>? simplified,
      Value<String>? traditional,
      Value<String>? pinyin,
      Value<String>? definitions,
      Value<String?>? examples}) {
    return DictionaryCompanion(
      id: id ?? this.id,
      simplified: simplified ?? this.simplified,
      traditional: traditional ?? this.traditional,
      pinyin: pinyin ?? this.pinyin,
      definitions: definitions ?? this.definitions,
      examples: examples ?? this.examples,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (simplified.present) {
      map['simplified'] = Variable<String>(simplified.value);
    }
    if (traditional.present) {
      map['traditional'] = Variable<String>(traditional.value);
    }
    if (pinyin.present) {
      map['pinyin'] = Variable<String>(pinyin.value);
    }
    if (definitions.present) {
      map['definitions'] = Variable<String>(definitions.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryCompanion(')
          ..write('id: $id, ')
          ..write('simplified: $simplified, ')
          ..write('traditional: $traditional, ')
          ..write('pinyin: $pinyin, ')
          ..write('definitions: $definitions, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }
}

class DictionaryFTS extends Table
    with
        TableInfo<DictionaryFTS, DictionaryFTSData>,
        VirtualTableInfo<DictionaryFTS, DictionaryFTSData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DictionaryFTS(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _simplifiedMeta =
      const VerificationMeta('simplified');
  late final GeneratedColumn<String> simplified = GeneratedColumn<String>(
      'simplified', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _traditionalMeta =
      const VerificationMeta('traditional');
  late final GeneratedColumn<String> traditional = GeneratedColumn<String>(
      'traditional', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _pinyinMeta = const VerificationMeta('pinyin');
  late final GeneratedColumn<String> pinyin = GeneratedColumn<String>(
      'pinyin', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _definitionsMeta =
      const VerificationMeta('definitions');
  late final GeneratedColumn<String> definitions = GeneratedColumn<String>(
      'definitions', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _examplesMeta =
      const VerificationMeta('examples');
  late final GeneratedColumn<String> examples = GeneratedColumn<String>(
      'examples', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [simplified, traditional, pinyin, definitions, examples];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionaryFTS';
  @override
  VerificationContext validateIntegrity(Insertable<DictionaryFTSData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('simplified')) {
      context.handle(
          _simplifiedMeta,
          simplified.isAcceptableOrUnknown(
              data['simplified']!, _simplifiedMeta));
    } else if (isInserting) {
      context.missing(_simplifiedMeta);
    }
    if (data.containsKey('traditional')) {
      context.handle(
          _traditionalMeta,
          traditional.isAcceptableOrUnknown(
              data['traditional']!, _traditionalMeta));
    } else if (isInserting) {
      context.missing(_traditionalMeta);
    }
    if (data.containsKey('pinyin')) {
      context.handle(_pinyinMeta,
          pinyin.isAcceptableOrUnknown(data['pinyin']!, _pinyinMeta));
    } else if (isInserting) {
      context.missing(_pinyinMeta);
    }
    if (data.containsKey('definitions')) {
      context.handle(
          _definitionsMeta,
          definitions.isAcceptableOrUnknown(
              data['definitions']!, _definitionsMeta));
    } else if (isInserting) {
      context.missing(_definitionsMeta);
    }
    if (data.containsKey('examples')) {
      context.handle(_examplesMeta,
          examples.isAcceptableOrUnknown(data['examples']!, _examplesMeta));
    } else if (isInserting) {
      context.missing(_examplesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DictionaryFTSData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionaryFTSData(
      simplified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}simplified'])!,
      traditional: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}traditional'])!,
      pinyin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pinyin'])!,
      definitions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definitions'])!,
      examples: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}examples'])!,
    );
  }

  @override
  DictionaryFTS createAlias(String alias) {
    return DictionaryFTS(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(simplified, traditional, pinyin, definitions, examples, content=\'dictionary\', content_rowid=\'id\', tokenize = \'unicode61 remove_diacritics 2\')';
}

class DictionaryFTSData extends DataClass
    implements Insertable<DictionaryFTSData> {
  final String simplified;
  final String traditional;
  final String pinyin;
  final String definitions;
  final String examples;
  const DictionaryFTSData(
      {required this.simplified,
      required this.traditional,
      required this.pinyin,
      required this.definitions,
      required this.examples});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['simplified'] = Variable<String>(simplified);
    map['traditional'] = Variable<String>(traditional);
    map['pinyin'] = Variable<String>(pinyin);
    map['definitions'] = Variable<String>(definitions);
    map['examples'] = Variable<String>(examples);
    return map;
  }

  DictionaryFTSCompanion toCompanion(bool nullToAbsent) {
    return DictionaryFTSCompanion(
      simplified: Value(simplified),
      traditional: Value(traditional),
      pinyin: Value(pinyin),
      definitions: Value(definitions),
      examples: Value(examples),
    );
  }

  factory DictionaryFTSData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryFTSData(
      simplified: serializer.fromJson<String>(json['simplified']),
      traditional: serializer.fromJson<String>(json['traditional']),
      pinyin: serializer.fromJson<String>(json['pinyin']),
      definitions: serializer.fromJson<String>(json['definitions']),
      examples: serializer.fromJson<String>(json['examples']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'simplified': serializer.toJson<String>(simplified),
      'traditional': serializer.toJson<String>(traditional),
      'pinyin': serializer.toJson<String>(pinyin),
      'definitions': serializer.toJson<String>(definitions),
      'examples': serializer.toJson<String>(examples),
    };
  }

  DictionaryFTSData copyWith(
          {String? simplified,
          String? traditional,
          String? pinyin,
          String? definitions,
          String? examples}) =>
      DictionaryFTSData(
        simplified: simplified ?? this.simplified,
        traditional: traditional ?? this.traditional,
        pinyin: pinyin ?? this.pinyin,
        definitions: definitions ?? this.definitions,
        examples: examples ?? this.examples,
      );
  DictionaryFTSData copyWithCompanion(DictionaryFTSCompanion data) {
    return DictionaryFTSData(
      simplified:
          data.simplified.present ? data.simplified.value : this.simplified,
      traditional:
          data.traditional.present ? data.traditional.value : this.traditional,
      pinyin: data.pinyin.present ? data.pinyin.value : this.pinyin,
      definitions:
          data.definitions.present ? data.definitions.value : this.definitions,
      examples: data.examples.present ? data.examples.value : this.examples,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryFTSData(')
          ..write('simplified: $simplified, ')
          ..write('traditional: $traditional, ')
          ..write('pinyin: $pinyin, ')
          ..write('definitions: $definitions, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(simplified, traditional, pinyin, definitions, examples);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionaryFTSData &&
          other.simplified == this.simplified &&
          other.traditional == this.traditional &&
          other.pinyin == this.pinyin &&
          other.definitions == this.definitions &&
          other.examples == this.examples);
}

class DictionaryFTSCompanion extends UpdateCompanion<DictionaryFTSData> {
  final Value<String> simplified;
  final Value<String> traditional;
  final Value<String> pinyin;
  final Value<String> definitions;
  final Value<String> examples;
  final Value<int> rowid;
  const DictionaryFTSCompanion({
    this.simplified = const Value.absent(),
    this.traditional = const Value.absent(),
    this.pinyin = const Value.absent(),
    this.definitions = const Value.absent(),
    this.examples = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DictionaryFTSCompanion.insert({
    required String simplified,
    required String traditional,
    required String pinyin,
    required String definitions,
    required String examples,
    this.rowid = const Value.absent(),
  })  : simplified = Value(simplified),
        traditional = Value(traditional),
        pinyin = Value(pinyin),
        definitions = Value(definitions),
        examples = Value(examples);
  static Insertable<DictionaryFTSData> custom({
    Expression<String>? simplified,
    Expression<String>? traditional,
    Expression<String>? pinyin,
    Expression<String>? definitions,
    Expression<String>? examples,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (simplified != null) 'simplified': simplified,
      if (traditional != null) 'traditional': traditional,
      if (pinyin != null) 'pinyin': pinyin,
      if (definitions != null) 'definitions': definitions,
      if (examples != null) 'examples': examples,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DictionaryFTSCompanion copyWith(
      {Value<String>? simplified,
      Value<String>? traditional,
      Value<String>? pinyin,
      Value<String>? definitions,
      Value<String>? examples,
      Value<int>? rowid}) {
    return DictionaryFTSCompanion(
      simplified: simplified ?? this.simplified,
      traditional: traditional ?? this.traditional,
      pinyin: pinyin ?? this.pinyin,
      definitions: definitions ?? this.definitions,
      examples: examples ?? this.examples,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (simplified.present) {
      map['simplified'] = Variable<String>(simplified.value);
    }
    if (traditional.present) {
      map['traditional'] = Variable<String>(traditional.value);
    }
    if (pinyin.present) {
      map['pinyin'] = Variable<String>(pinyin.value);
    }
    if (definitions.present) {
      map['definitions'] = Variable<String>(definitions.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryFTSCompanion(')
          ..write('simplified: $simplified, ')
          ..write('traditional: $traditional, ')
          ..write('pinyin: $pinyin, ')
          ..write('definitions: $definitions, ')
          ..write('examples: $examples, ')
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
  late final TranslationHistoryFTS translationHistoryFTS =
      TranslationHistoryFTS(this);
  late final TranslationHistoryItemFTS translationHistoryItemFTS =
      TranslationHistoryItemFTS(this);
  late final Index idxTranslationHistoryInput = Index(
      'idx_translationHistory_input',
      'CREATE INDEX IF NOT EXISTS idx_translationHistory_input ON translationHistory (input)');
  late final Index idxTranslationHistoryItemOutput = Index(
      'idx_translationHistoryItem_output',
      'CREATE INDEX IF NOT EXISTS idx_translationHistoryItem_output ON translationHistoryItem (output)');
  late final Trigger thAi = Trigger(
      'CREATE TRIGGER IF NOT EXISTS th_ai AFTER INSERT ON translationHistory BEGIN INSERT INTO translationHistoryFTS ("rowid", input) VALUES (new.id, new.input);END',
      'th_ai');
  late final Trigger thAd = Trigger(
      'CREATE TRIGGER IF NOT EXISTS th_ad AFTER DELETE ON translationHistory BEGIN INSERT INTO translationHistoryFTS (translationHistoryFTS, "rowid", input) VALUES (\'delete\', old.id, old.input);END',
      'th_ad');
  late final Trigger thAu = Trigger(
      'CREATE TRIGGER IF NOT EXISTS th_au AFTER UPDATE ON translationHistory BEGIN INSERT INTO translationHistoryFTS (translationHistoryFTS, "rowid", input) VALUES (\'delete\', old.id, old.input);INSERT INTO translationHistoryFTS ("rowid", input) VALUES (new.id, new.input);END',
      'th_au');
  late final Trigger thiAi = Trigger(
      'CREATE TRIGGER IF NOT EXISTS thi_ai AFTER INSERT ON translationHistoryItem BEGIN INSERT INTO translationHistoryItemFTS ("rowid", output) VALUES (new.id, new.output);END',
      'thi_ai');
  late final Trigger thiAd = Trigger(
      'CREATE TRIGGER IF NOT EXISTS thi_ad AFTER DELETE ON translationHistoryItem BEGIN INSERT INTO translationHistoryItemFTS (translationHistoryItemFTS, "rowid", output) VALUES (\'delete\', old.id, old.output);END',
      'thi_ad');
  late final Trigger thiAu = Trigger(
      'CREATE TRIGGER IF NOT EXISTS thi_au AFTER UPDATE ON translationHistoryItem BEGIN INSERT INTO translationHistoryItemFTS (translationHistoryItemFTS, "rowid", output) VALUES (\'delete\', old.id, old.output);INSERT INTO translationHistoryItemFTS ("rowid", output) VALUES (new.id, new.output);END',
      'thi_au');
  late final Dictionary dictionary = Dictionary(this);
  late final DictionaryFTS dictionaryFTS = DictionaryFTS(this);
  late final Trigger dictionaryAi = Trigger(
      'CREATE TRIGGER dictionary_ai AFTER INSERT ON dictionary BEGIN INSERT INTO dictionaryFTS ("rowid", simplified, traditional, pinyin, definitions, examples) VALUES (new.id, new.simplified, new.traditional, new.pinyin, new.definitions, new.examples);END',
      'dictionary_ai');
  late final Trigger dictionaryAu = Trigger(
      'CREATE TRIGGER dictionary_au AFTER UPDATE ON dictionary BEGIN UPDATE dictionaryFTS SET simplified = new.simplified, traditional = new.traditional, pinyin = new.pinyin, definitions = new.definitions, examples = new.examples WHERE "rowid" = new.id;END',
      'dictionary_au');
  late final Trigger dictionaryAd = Trigger(
      'CREATE TRIGGER dictionary_ad AFTER DELETE ON dictionary BEGIN DELETE FROM dictionaryFTS WHERE "rowid" = old.id;END',
      'dictionary_ad');
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

  Selectable<QueryTranslationHistoryResult> queryTranslationHistory(
      String ftsQuery, String likeQuery) {
    return customSelect(
        'WITH input_match_hits AS (SELECT th.id, bm25(translationHistoryFTS, 1.0) AS rank_score, 1 AS priority FROM translationHistoryFTS JOIN translationHistory AS th ON th.id = translationHistoryFTS."rowid" WHERE translationHistoryFTS MATCH ?1), item_match_hits AS (SELECT th.id, bm25(translationHistoryItemFTS, 1.0) AS rank_score, 2 AS priority FROM translationHistoryItemFTS JOIN translationHistoryItem AS thi ON thi.id = translationHistoryItemFTS."rowid" JOIN translationHistory AS th ON th.id = thi.parentID WHERE translationHistoryItemFTS MATCH ?1), input_like_hits AS (SELECT th.id, 15.0 AS rank_score, 3 AS priority FROM translationHistory AS th WHERE th.input LIKE ?2 ESCAPE \'\\\'), item_like_hits AS (SELECT th.id, 15.0 AS rank_score, 4 AS priority FROM translationHistoryItem AS thi JOIN translationHistory AS th ON th.id = thi.parentID WHERE thi.output LIKE ?2 ESCAPE \'\\\'), all_hits AS (SELECT * FROM input_match_hits UNION ALL SELECT * FROM item_match_hits UNION ALL SELECT * FROM input_like_hits UNION ALL SELECT * FROM item_like_hits), best_hits AS (SELECT id, MIN(priority) AS best_priority, MIN(rank_score) AS best_rank FROM all_hits GROUP BY id) SELECT th.id, th.createdAt, th.input, json_group_array(json_object(\'id\', thi.id, \'parentID\', thi.parentID, \'translator\', thi.translator, \'output\', thi.output)) AS historyItems FROM best_hits AS bh JOIN translationHistory AS th ON th.id = bh.id JOIN translationHistoryItem AS thi ON thi.parentID = th.id GROUP BY th.id ORDER BY bh.best_priority, bh.best_rank',
        variables: [
          Variable<String>(ftsQuery),
          Variable<String>(likeQuery)
        ],
        readsFrom: {
          translationHistory,
          translationHistoryFTS,
          translationHistoryItemFTS,
          translationHistoryItem,
        }).map((QueryRow row) => QueryTranslationHistoryResult(
          id: row.read<int>('id'),
          createdAt: row.read<String>('createdAt'),
          input: row.read<String>('input'),
          historyItems: row.read<String>('historyItems'),
        ));
  }

  Selectable<bool> checkIfDictionaryisEmpty() {
    return customSelect(
        'SELECT NOT EXISTS (SELECT 1 AS _c0 FROM dictionary) AS is_empty',
        variables: [],
        readsFrom: {
          dictionary,
        }).map((QueryRow row) => row.read<bool>('is_empty'));
  }

  Selectable<QueryDictionaryResult> queryDictionary(
      String ftsQuery, String likeQuery) {
    return customSelect(
        'WITH fts_hits AS (SELECT dictionary.id AS parentID, dictionaryFTS.simplified, dictionaryFTS.traditional, dictionaryFTS.pinyin, dictionaryFTS.definitions, dictionaryFTS.examples, bm25(dictionaryFTS, 1.0, 1.0, 1.0, 2.0, 3.0) AS rank_score, 1 AS priority FROM dictionaryFTS JOIN dictionary ON dictionary.id = dictionaryFTS."rowid" WHERE dictionaryFTS MATCH ?1), like_hits AS (SELECT d.id AS parentID, d.simplified, d.traditional, d.pinyin, d.definitions, d.examples, 10.0 AS rank_score, 2 AS priority FROM dictionary AS d WHERE d.simplified LIKE ?2 ESCAPE \'\\\' OR d.traditional LIKE ?2 ESCAPE \'\\\' OR d.pinyin LIKE ?2 ESCAPE \'\\\') SELECT parentID, simplified, traditional, pinyin, definitions, examples FROM (SELECT * FROM fts_hits UNION ALL SELECT * FROM like_hits) ORDER BY priority, rank_score LIMIT 100',
        variables: [
          Variable<String>(ftsQuery),
          Variable<String>(likeQuery)
        ],
        readsFrom: {
          dictionary,
          dictionaryFTS,
        }).map((QueryRow row) => QueryDictionaryResult(
          parentID: row.read<int>('parentID'),
          simplified: row.read<String>('simplified'),
          traditional: row.read<String>('traditional'),
          pinyin: row.read<String>('pinyin'),
          definitions: row.read<String>('definitions'),
          examples: row.readNullable<String>('examples'),
        ));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        translationHistory,
        translationHistoryItem,
        translationHistoryFTS,
        translationHistoryItemFTS,
        idxTranslationHistoryInput,
        idxTranslationHistoryItemOutput,
        thAi,
        thAd,
        thAu,
        thiAi,
        thiAd,
        thiAu,
        dictionary,
        dictionaryFTS,
        dictionaryAi,
        dictionaryAu,
        dictionaryAd
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistory',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('translationHistoryItem', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistory',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('translationHistoryFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistory',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('translationHistoryFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistory',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('translationHistoryFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistoryItem',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('translationHistoryItemFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistoryItem',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('translationHistoryItemFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('translationHistoryItem',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('translationHistoryItemFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('dictionary',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('dictionaryFTS', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('dictionary',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('dictionaryFTS', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('dictionary',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('dictionaryFTS', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
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
typedef $TranslationHistoryFTSCreateCompanionBuilder
    = TranslationHistoryFTSCompanion Function({
  required String input,
  Value<int> rowid,
});
typedef $TranslationHistoryFTSUpdateCompanionBuilder
    = TranslationHistoryFTSCompanion Function({
  Value<String> input,
  Value<int> rowid,
});

class $TranslationHistoryFTSFilterComposer
    extends Composer<_$AppDatabase, TranslationHistoryFTS> {
  $TranslationHistoryFTSFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get input => $composableBuilder(
      column: $table.input, builder: (column) => ColumnFilters(column));
}

class $TranslationHistoryFTSOrderingComposer
    extends Composer<_$AppDatabase, TranslationHistoryFTS> {
  $TranslationHistoryFTSOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get input => $composableBuilder(
      column: $table.input, builder: (column) => ColumnOrderings(column));
}

class $TranslationHistoryFTSAnnotationComposer
    extends Composer<_$AppDatabase, TranslationHistoryFTS> {
  $TranslationHistoryFTSAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get input =>
      $composableBuilder(column: $table.input, builder: (column) => column);
}

class $TranslationHistoryFTSTableManager extends RootTableManager<
    _$AppDatabase,
    TranslationHistoryFTS,
    TranslationHistoryFTSData,
    $TranslationHistoryFTSFilterComposer,
    $TranslationHistoryFTSOrderingComposer,
    $TranslationHistoryFTSAnnotationComposer,
    $TranslationHistoryFTSCreateCompanionBuilder,
    $TranslationHistoryFTSUpdateCompanionBuilder,
    (
      TranslationHistoryFTSData,
      BaseReferences<_$AppDatabase, TranslationHistoryFTS,
          TranslationHistoryFTSData>
    ),
    TranslationHistoryFTSData,
    PrefetchHooks Function()> {
  $TranslationHistoryFTSTableManager(
      _$AppDatabase db, TranslationHistoryFTS table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TranslationHistoryFTSFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TranslationHistoryFTSOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TranslationHistoryFTSAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> input = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TranslationHistoryFTSCompanion(
            input: input,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String input,
            Value<int> rowid = const Value.absent(),
          }) =>
              TranslationHistoryFTSCompanion.insert(
            input: input,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $TranslationHistoryFTSProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TranslationHistoryFTS,
    TranslationHistoryFTSData,
    $TranslationHistoryFTSFilterComposer,
    $TranslationHistoryFTSOrderingComposer,
    $TranslationHistoryFTSAnnotationComposer,
    $TranslationHistoryFTSCreateCompanionBuilder,
    $TranslationHistoryFTSUpdateCompanionBuilder,
    (
      TranslationHistoryFTSData,
      BaseReferences<_$AppDatabase, TranslationHistoryFTS,
          TranslationHistoryFTSData>
    ),
    TranslationHistoryFTSData,
    PrefetchHooks Function()>;
typedef $TranslationHistoryItemFTSCreateCompanionBuilder
    = TranslationHistoryItemFTSCompanion Function({
  required String output,
  Value<int> rowid,
});
typedef $TranslationHistoryItemFTSUpdateCompanionBuilder
    = TranslationHistoryItemFTSCompanion Function({
  Value<String> output,
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
  ColumnFilters<String> get output => $composableBuilder(
      column: $table.output, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get output => $composableBuilder(
      column: $table.output, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get output =>
      $composableBuilder(column: $table.output, builder: (column) => column);
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
            Value<String> output = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TranslationHistoryItemFTSCompanion(
            output: output,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String output,
            Value<int> rowid = const Value.absent(),
          }) =>
              TranslationHistoryItemFTSCompanion.insert(
            output: output,
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
typedef $DictionaryCreateCompanionBuilder = DictionaryCompanion Function({
  Value<int> id,
  required String simplified,
  required String traditional,
  required String pinyin,
  required String definitions,
  Value<String?> examples,
});
typedef $DictionaryUpdateCompanionBuilder = DictionaryCompanion Function({
  Value<int> id,
  Value<String> simplified,
  Value<String> traditional,
  Value<String> pinyin,
  Value<String> definitions,
  Value<String?> examples,
});

class $DictionaryFilterComposer extends Composer<_$AppDatabase, Dictionary> {
  $DictionaryFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get simplified => $composableBuilder(
      column: $table.simplified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get traditional => $composableBuilder(
      column: $table.traditional, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pinyin => $composableBuilder(
      column: $table.pinyin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get definitions => $composableBuilder(
      column: $table.definitions, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get examples => $composableBuilder(
      column: $table.examples, builder: (column) => ColumnFilters(column));
}

class $DictionaryOrderingComposer extends Composer<_$AppDatabase, Dictionary> {
  $DictionaryOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get simplified => $composableBuilder(
      column: $table.simplified, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get traditional => $composableBuilder(
      column: $table.traditional, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pinyin => $composableBuilder(
      column: $table.pinyin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get definitions => $composableBuilder(
      column: $table.definitions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get examples => $composableBuilder(
      column: $table.examples, builder: (column) => ColumnOrderings(column));
}

class $DictionaryAnnotationComposer
    extends Composer<_$AppDatabase, Dictionary> {
  $DictionaryAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get simplified => $composableBuilder(
      column: $table.simplified, builder: (column) => column);

  GeneratedColumn<String> get traditional => $composableBuilder(
      column: $table.traditional, builder: (column) => column);

  GeneratedColumn<String> get pinyin =>
      $composableBuilder(column: $table.pinyin, builder: (column) => column);

  GeneratedColumn<String> get definitions => $composableBuilder(
      column: $table.definitions, builder: (column) => column);

  GeneratedColumn<String> get examples =>
      $composableBuilder(column: $table.examples, builder: (column) => column);
}

class $DictionaryTableManager extends RootTableManager<
    _$AppDatabase,
    Dictionary,
    DictionaryData,
    $DictionaryFilterComposer,
    $DictionaryOrderingComposer,
    $DictionaryAnnotationComposer,
    $DictionaryCreateCompanionBuilder,
    $DictionaryUpdateCompanionBuilder,
    (DictionaryData, BaseReferences<_$AppDatabase, Dictionary, DictionaryData>),
    DictionaryData,
    PrefetchHooks Function()> {
  $DictionaryTableManager(_$AppDatabase db, Dictionary table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DictionaryFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DictionaryOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DictionaryAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> simplified = const Value.absent(),
            Value<String> traditional = const Value.absent(),
            Value<String> pinyin = const Value.absent(),
            Value<String> definitions = const Value.absent(),
            Value<String?> examples = const Value.absent(),
          }) =>
              DictionaryCompanion(
            id: id,
            simplified: simplified,
            traditional: traditional,
            pinyin: pinyin,
            definitions: definitions,
            examples: examples,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String simplified,
            required String traditional,
            required String pinyin,
            required String definitions,
            Value<String?> examples = const Value.absent(),
          }) =>
              DictionaryCompanion.insert(
            id: id,
            simplified: simplified,
            traditional: traditional,
            pinyin: pinyin,
            definitions: definitions,
            examples: examples,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $DictionaryProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Dictionary,
    DictionaryData,
    $DictionaryFilterComposer,
    $DictionaryOrderingComposer,
    $DictionaryAnnotationComposer,
    $DictionaryCreateCompanionBuilder,
    $DictionaryUpdateCompanionBuilder,
    (DictionaryData, BaseReferences<_$AppDatabase, Dictionary, DictionaryData>),
    DictionaryData,
    PrefetchHooks Function()>;
typedef $DictionaryFTSCreateCompanionBuilder = DictionaryFTSCompanion Function({
  required String simplified,
  required String traditional,
  required String pinyin,
  required String definitions,
  required String examples,
  Value<int> rowid,
});
typedef $DictionaryFTSUpdateCompanionBuilder = DictionaryFTSCompanion Function({
  Value<String> simplified,
  Value<String> traditional,
  Value<String> pinyin,
  Value<String> definitions,
  Value<String> examples,
  Value<int> rowid,
});

class $DictionaryFTSFilterComposer
    extends Composer<_$AppDatabase, DictionaryFTS> {
  $DictionaryFTSFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get simplified => $composableBuilder(
      column: $table.simplified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get traditional => $composableBuilder(
      column: $table.traditional, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pinyin => $composableBuilder(
      column: $table.pinyin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get definitions => $composableBuilder(
      column: $table.definitions, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get examples => $composableBuilder(
      column: $table.examples, builder: (column) => ColumnFilters(column));
}

class $DictionaryFTSOrderingComposer
    extends Composer<_$AppDatabase, DictionaryFTS> {
  $DictionaryFTSOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get simplified => $composableBuilder(
      column: $table.simplified, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get traditional => $composableBuilder(
      column: $table.traditional, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pinyin => $composableBuilder(
      column: $table.pinyin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get definitions => $composableBuilder(
      column: $table.definitions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get examples => $composableBuilder(
      column: $table.examples, builder: (column) => ColumnOrderings(column));
}

class $DictionaryFTSAnnotationComposer
    extends Composer<_$AppDatabase, DictionaryFTS> {
  $DictionaryFTSAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get simplified => $composableBuilder(
      column: $table.simplified, builder: (column) => column);

  GeneratedColumn<String> get traditional => $composableBuilder(
      column: $table.traditional, builder: (column) => column);

  GeneratedColumn<String> get pinyin =>
      $composableBuilder(column: $table.pinyin, builder: (column) => column);

  GeneratedColumn<String> get definitions => $composableBuilder(
      column: $table.definitions, builder: (column) => column);

  GeneratedColumn<String> get examples =>
      $composableBuilder(column: $table.examples, builder: (column) => column);
}

class $DictionaryFTSTableManager extends RootTableManager<
    _$AppDatabase,
    DictionaryFTS,
    DictionaryFTSData,
    $DictionaryFTSFilterComposer,
    $DictionaryFTSOrderingComposer,
    $DictionaryFTSAnnotationComposer,
    $DictionaryFTSCreateCompanionBuilder,
    $DictionaryFTSUpdateCompanionBuilder,
    (
      DictionaryFTSData,
      BaseReferences<_$AppDatabase, DictionaryFTS, DictionaryFTSData>
    ),
    DictionaryFTSData,
    PrefetchHooks Function()> {
  $DictionaryFTSTableManager(_$AppDatabase db, DictionaryFTS table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DictionaryFTSFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DictionaryFTSOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DictionaryFTSAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> simplified = const Value.absent(),
            Value<String> traditional = const Value.absent(),
            Value<String> pinyin = const Value.absent(),
            Value<String> definitions = const Value.absent(),
            Value<String> examples = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DictionaryFTSCompanion(
            simplified: simplified,
            traditional: traditional,
            pinyin: pinyin,
            definitions: definitions,
            examples: examples,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String simplified,
            required String traditional,
            required String pinyin,
            required String definitions,
            required String examples,
            Value<int> rowid = const Value.absent(),
          }) =>
              DictionaryFTSCompanion.insert(
            simplified: simplified,
            traditional: traditional,
            pinyin: pinyin,
            definitions: definitions,
            examples: examples,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $DictionaryFTSProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    DictionaryFTS,
    DictionaryFTSData,
    $DictionaryFTSFilterComposer,
    $DictionaryFTSOrderingComposer,
    $DictionaryFTSAnnotationComposer,
    $DictionaryFTSCreateCompanionBuilder,
    $DictionaryFTSUpdateCompanionBuilder,
    (
      DictionaryFTSData,
      BaseReferences<_$AppDatabase, DictionaryFTS, DictionaryFTSData>
    ),
    DictionaryFTSData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $TranslationHistoryTableManager get translationHistory =>
      $TranslationHistoryTableManager(_db, _db.translationHistory);
  $TranslationHistoryItemTableManager get translationHistoryItem =>
      $TranslationHistoryItemTableManager(_db, _db.translationHistoryItem);
  $TranslationHistoryFTSTableManager get translationHistoryFTS =>
      $TranslationHistoryFTSTableManager(_db, _db.translationHistoryFTS);
  $TranslationHistoryItemFTSTableManager get translationHistoryItemFTS =>
      $TranslationHistoryItemFTSTableManager(
          _db, _db.translationHistoryItemFTS);
  $DictionaryTableManager get dictionary =>
      $DictionaryTableManager(_db, _db.dictionary);
  $DictionaryFTSTableManager get dictionaryFTS =>
      $DictionaryFTSTableManager(_db, _db.dictionaryFTS);
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

class QueryTranslationHistoryResult {
  final int id;
  final String createdAt;
  final String input;
  final String historyItems;
  QueryTranslationHistoryResult({
    required this.id,
    required this.createdAt,
    required this.input,
    required this.historyItems,
  });
}

class QueryDictionaryResult {
  final int parentID;
  final String simplified;
  final String traditional;
  final String pinyin;
  final String definitions;
  final String? examples;
  QueryDictionaryResult({
    required this.parentID,
    required this.simplified,
    required this.traditional,
    required this.pinyin,
    required this.definitions,
    this.examples,
  });
}
