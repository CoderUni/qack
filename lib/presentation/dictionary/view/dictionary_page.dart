import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/utils/database/database.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appDB = context.read<AppDatabase>();
    appDB.select(appDB.dictionary).get().then(print);
    return const Scaffold();
  }
}

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
