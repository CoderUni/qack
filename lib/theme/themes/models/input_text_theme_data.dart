import 'package:flutter/material.dart';
import 'package:qack/widgets/input/input_text.dart';

/// {@template input_text_theme_data}
/// Stores input text theme configuration
/// {@endtemplate}
class InputTextThemeData {
  /// {@macro input_text_theme_data}
  const InputTextThemeData({
    required this.borderSideColor,
    required this.focusedBorderSideColor,
    required this.iconColor,
    required this.errorColor,
  }) : cursorColor = focusedBorderSideColor;

  /// Color of the border outline
  final Color borderSideColor;

  /// Color of the focused border outline
  final Color focusedBorderSideColor;

  /// Color of the focused [InputText] cursor
  /// Value is bound to [focusedBorderSideColor]
  final Color cursorColor;

  /// Color of icon
  final Color iconColor;

  /// Error color of the [InputText]
  final Color errorColor;
}
