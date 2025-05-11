import 'package:flutter/material.dart';

/// {@template settings_theme_data}
/// Stores settings theme configuration
/// {@endtemplate}
class SettingsThemeData {
  /// {@macro settings_theme_data}
  const SettingsThemeData({
    required this.checkmarkColor,
    required this.editNameColor,
  });

  /// Color of checkmark icon
  final Color checkmarkColor;

  /// Color of edit username settings list tile
  final Color editNameColor;
}
