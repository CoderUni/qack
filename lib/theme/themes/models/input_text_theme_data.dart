import 'package:flutter/material.dart';
import 'package:qack/presentation/home/components/input/input_text.dart'
    show InputText;

/// {@template input_text_theme_data}
/// Stores input text theme configuration
/// {@endtemplate}
class InputTextThemeData {
  /// {@macro input_text_theme_data}
  const InputTextThemeData({
    required this.borderSideColor,
    required this.iconColor,
    required this.errorColor,
  });

  /// Color of the border outline
  final Color borderSideColor;

  /// Color of icon
  final Color iconColor;

  /// Error color of the [InputText]
  final Color errorColor;
}
