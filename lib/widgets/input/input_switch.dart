// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:qack/theme/theme.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    required this.value,
    required this.onChanged,
    this.color,
    super.key,
  });

  final bool value;
  final void Function(bool value)? onChanged;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: theme.settingsThemeData.switchActiveColor,
    );
  }
}
