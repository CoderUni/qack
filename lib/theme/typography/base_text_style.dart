import 'package:flutter/material.dart';

/// Template for creating [TextStyle] with different font weights
abstract class BaseTextStyle {
  /// Regular font weight
  TextStyle get regular;

  /// Medium font weight
  TextStyle get medium;

  /// Semi-bold font weight
  TextStyle get semiBold;

  /// Bold font weight
  TextStyle get bold;
}

extension TextStyleExt on TextStyle {
  /// Returns a [TextStyle] with the specified font size
  TextStyle get withChineseLetterSpacing {
    return copyWith(letterSpacing: (letterSpacing ?? 0) + 0.5);
  }
}
