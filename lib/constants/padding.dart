import 'package:flutter/material.dart';

/// {@template padding_constants}
/// Contains consistent paddings used in the app
/// {@endtemplate}
abstract class PaddingConstants {
  /// {@macro padding_constants}
  const PaddingConstants();

  /// Horizontal margin of mobile device content
  static const EdgeInsets mobileHorizontalMargin =
      EdgeInsets.symmetric(horizontal: 16);

  /// Horizontal margin of tablet device content
  static const EdgeInsets tabletHorizontalMargin =
      EdgeInsets.symmetric(horizontal: 32);
}
