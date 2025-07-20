import 'package:flutter/material.dart';
import 'package:qack/utils/database/database.dart';
import 'package:qack/widgets/divider.dart';

class DictionaryListTile extends StatelessWidget {
  const DictionaryListTile({required this.entry, super.key});
  final DictionaryData entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${entry.simplified} '
            '${(entry.simplified != entry.traditional) ? "(${entry.traditional}) " : ""}'
            '- ${entry.pinyin}',
          ),
          Text(entry.definitions),
          const SizedBox(height: 4),
          const AppDivider(),
        ],
      ),
    );
  }
}
