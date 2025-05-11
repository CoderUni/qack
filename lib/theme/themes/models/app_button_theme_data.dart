import 'package:flutter/material.dart';

/// {@template app_button_theme_data}
/// Stores button theme configuration
/// {@endtemplate}
class AppButtonThemeData {
  /// {@macro app_button_theme_data}
  const AppButtonThemeData({
    required this.textColor,
    required this.primaryButtonColor,
  });

  /// Text color of button
  final Color textColor;

  /// Primary color of button
  final Color primaryButtonColor;
}
