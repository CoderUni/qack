import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qack/utils/database/database.dart';

part 'history.g.dart';

class TranslationHistory extends Equatable {
  const TranslationHistory({
    required this.timestamp,
    required this.input,
    this.id,
    this.items,
  });

  final int? id;
  final DateTime timestamp;
  final String input;
  final List<TranslationHistoryItem>? items;

  @override
  List<Object?> get props => [id, timestamp, input, items];

  TranslationHistoryCompanion toCompanion() {
    return TranslationHistoryCompanion(
      createdAt: Value(timestamp.toIso8601String()),
      input: Value(input),
      // items is not directly stored in the TranslationHistory table. It is only used
      // for accessing them after they got fetched
    );
  }

  TranslationHistory copyWith({
    int? id,
    DateTime? timestamp,
    String? input,
    List<TranslationHistoryItem>? items,
  }) {
    return TranslationHistory(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      input: input ?? this.input,
      items: items ?? this.items,
    );
  }
}

@JsonSerializable()
class TranslationHistoryItem extends Equatable {
  const TranslationHistoryItem({
    required this.id,
    required this.parentID,
    required this.translator,
    required this.output,
  });

  factory TranslationHistoryItem.fromJson(Map<String, dynamic> json) {
    return _$TranslationHistoryItemFromJson(json);
  }

  final int id;
  final int parentID;
  final int translator;
  final String output;

  @override
  List<Object?> get props => [id, parentID, translator, output];

  TranslationHistoryItemCompanion toCompanion() {
    return TranslationHistoryItemCompanion(
      parentID: Value(parentID),
      translator: Value(translator),
      output: Value(output),
    );
  }

  Map<String, dynamic> toJson() => _$TranslationHistoryItemToJson(this);

  static List<TranslationHistoryItem> stringToList(
    String json,
  ) {
    final jsonList = jsonDecode(json) as List<dynamic>?;
    return jsonList != null
        ? jsonList
            .map(
              (json) =>
                  TranslationHistoryItem.fromJson(json as Map<String, dynamic>),
            )
            .toList()
        : [];
  }
}
