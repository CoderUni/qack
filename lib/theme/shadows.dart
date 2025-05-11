import 'package:flutter/material.dart';
import 'package:qack/theme/colors.dart';

/// {@template app_shadows}
/// Defines the BoxShadow configurations
/// {@endtemplate}
abstract class AppShadows {
  /// {@macro app_shadows}
  const AppShadows();

  /// Extra small shadow
  static List<BoxShadow> xs({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(12),
        offset: const Offset(0, 1),
        blurRadius: 2,
      ),
    ];
  }

  /// Small shadow
  static List<BoxShadow> sm({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(25),
        offset: const Offset(0, 1),
        blurRadius: 3,
      ),
      BoxShadow(
        color: shadowColor.withAlpha(15),
        offset: const Offset(0, 1),
        blurRadius: 2,
      ),
    ];
  }

  /// Medium shadow
  static List<BoxShadow> md({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(25),
        offset: const Offset(0, 4),
        blurRadius: 8,
        spreadRadius: -2,
      ),
      BoxShadow(
        color: shadowColor.withAlpha(15),
        offset: const Offset(0, 2),
        blurRadius: 4,
        spreadRadius: -2,
      ),
    ];
  }

  /// Large shadow
  static List<BoxShadow> lg({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(20),
        offset: const Offset(0, 12),
        blurRadius: 16,
        spreadRadius: -4,
      ),
      BoxShadow(
        color: shadowColor.withAlpha(8),
        offset: const Offset(0, 4),
        blurRadius: 6,
        spreadRadius: -2,
      ),
    ];
  }

  /// Extra large shadow
  static List<BoxShadow> xl({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(20),
        offset: const Offset(0, 20),
        blurRadius: 24,
        spreadRadius: -4,
      ),
      BoxShadow(
        color: shadowColor.withAlpha(8),
        offset: const Offset(0, 8),
        blurRadius: 8,
        spreadRadius: -4,
      ),
    ];
  }

  /// Double xl shadow
  static List<BoxShadow> doubleXL({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(46),
        offset: const Offset(0, 24),
        blurRadius: 48,
        spreadRadius: -12,
      ),
    ];
  }

  /// Triple xl shadow
  static List<BoxShadow> tripleXL({Color shadowColor = AppColors.shadowColor}) {
    return [
      BoxShadow(
        color: shadowColor.withAlpha(36),
        offset: const Offset(0, 32),
        blurRadius: 64,
        spreadRadius: -12,
      ),
    ];
  }

  /// Invert the y offset of every box shadow in the list
  static List<BoxShadow> invertY(List<BoxShadow> shadows) {
    return shadows.map((shadow) {
      return BoxShadow(
        color: shadow.color,
        offset: Offset(shadow.offset.dx, -shadow.offset.dy),
        blurRadius: shadow.blurRadius,
        spreadRadius: shadow.spreadRadius,
      );
    }).toList();
  }
}
