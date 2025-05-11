import 'package:flutter/material.dart';
import 'package:qack/theme/colors.dart';

/// Defines the gradients used throughout the app
abstract class AppGradients {
  /// Colors shift from `orange500` to `orangeDark300`
  /// Direction starts from `centerLeft` to `centerRight`
  static const sunRise = LinearGradient(
    colors: [
      AppColors.orange500,
      AppColors.orangeDark300,
    ],
  );

  /// Colors shift from `orange500` to `orange400`
  /// Direction starts from `centerLeft` to `centerRight`
  static const sunSet = LinearGradient(
    colors: [
      AppColors.orange500,
      AppColors.orange400,
    ],
  );

  /// Colors shift from `primary600` to `primary500`
  /// Direction starts from `centerLeft` to `centerRight`
  static const moonRise = LinearGradient(
    colors: [
      AppColors.primary600,
      AppColors.primary500,
    ],
  );
}
