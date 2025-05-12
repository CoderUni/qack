import 'package:flutter/material.dart';

/// {@template settings_theme_data}
/// Stores settings theme configuration
/// {@endtemplate}
class SettingsThemeData {
  /// {@macro settings_theme_data}
  const SettingsThemeData({
    required this.checkmarkColor,
    required this.editUsernameColor,
    required this.editTranslatorColor,
    required this.settingsCheckmarkColor,
    required this.switchActiveColor,
  });

  /// Color of checkmark icon
  final Color checkmarkColor;

  /// Color of edit username settings list tile
  final Color editUsernameColor;

  /// Color of edit translator settings list tile
  final Color editTranslatorColor;

  /// Color of settings checkmark icon
  final Color settingsCheckmarkColor;

  /// Active color of settings switch
  final Color switchActiveColor;
}
