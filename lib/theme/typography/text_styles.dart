import 'package:flutter/material.dart';
import 'package:qack/theme/typography/base_text_style.dart';

/// Defines the app text style definitions
abstract class AppTextStyle {
  /// `Display2XL` text style
  static const display2XL = _Display2XL();

  /// `DisplayXL` text style
  static const displayXL = _DisplayXL();

  /// `DisplayLG` text style
  static const displayLG = _DisplayLG();

  /// `DisplayMD` text style
  static const displayMD = _DisplayMD();

  /// `DisplaySM` text style
  static const displaySM = _DisplaySM();

  /// `DisplayXS` text style
  static const displayXS = _DisplayXS();

  /// `TextXL` text style
  static const textXL = _TextXL();

  /// `TextLG` text style
  static const textLG = _TextLG();

  /// `TextMD` text style
  static const textMD = _TextMD();

  /// `TextSM` text style
  static const textSM = _TextSM();

  /// `TextXS` text style
  static const textXS = _TextXS();
}

/// Namespace for `Display 2XL` font size
class _Display2XL implements BaseTextStyle {
  const _Display2XL();

  TextStyle get _base => const TextStyle(
        fontSize: 72,
        letterSpacing: -2,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Display XL` font size
class _DisplayXL implements BaseTextStyle {
  const _DisplayXL();

  TextStyle get _base => const TextStyle(
        fontSize: 60,
        letterSpacing: -2,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Display LG` font size
class _DisplayLG implements BaseTextStyle {
  const _DisplayLG();

  TextStyle get _base => const TextStyle(
        fontSize: 48,
        letterSpacing: -2,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Display MD` font size
class _DisplayMD implements BaseTextStyle {
  const _DisplayMD();

  TextStyle get _base => const TextStyle(
        fontSize: 36,
        letterSpacing: -2,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Display SM` font size
class _DisplaySM implements BaseTextStyle {
  const _DisplaySM();

  TextStyle get _base => const TextStyle(
        fontSize: 24,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Display XS` font size
class _DisplayXS implements BaseTextStyle {
  const _DisplayXS();

  TextStyle get _base => const TextStyle(
        fontSize: 18,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Text XL` font size
class _TextXL implements BaseTextStyle {
  const _TextXL();

  TextStyle get _base => const TextStyle(
        fontSize: 20,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Text LG` font size
class _TextLG implements BaseTextStyle {
  const _TextLG();

  TextStyle get _base => const TextStyle(
        fontSize: 18,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Text MD` font size
class _TextMD implements BaseTextStyle {
  const _TextMD();

  TextStyle get _base => const TextStyle(
        fontSize: 16,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Text SM` font size
class _TextSM implements BaseTextStyle {
  const _TextSM();

  TextStyle get _base => const TextStyle(
        fontSize: 14,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}

/// Namespace for `Text XS` font size
class _TextXS implements BaseTextStyle {
  const _TextXS();

  TextStyle get _base => const TextStyle(
        fontSize: 12,
        letterSpacing: 0,
      );

  @override
  TextStyle get regular => _base.copyWith(fontWeight: FontWeight.normal);

  @override
  TextStyle get medium => _base.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get semiBold => _base.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle get bold => _base.copyWith(fontWeight: FontWeight.w700);
}
