import 'package:flutter/material.dart';

/// {@template search_bar_theme_data}
/// Stores search bar theme configuration
/// {@endtemplate}
class AppSearchBarThemeData {
  /// {@macro search_bar_theme_data}
  const AppSearchBarThemeData({
    required this.backgroundColor,
    required this.iconColor,
    required this.hintColor,
  });

  /// Background color of [SearchBar]
  final Color backgroundColor;

  /// Color of [SearchBar] icon
  final Color iconColor;

  /// Color of [SearchBar] hint text
  final Color hintColor;
}
