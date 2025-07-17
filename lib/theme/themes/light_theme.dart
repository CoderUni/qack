import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qack/theme/colors.dart';
import 'package:qack/theme/shadows.dart';
import 'package:qack/theme/themes/base_theme.dart';
import 'package:qack/theme/themes/models/models.dart';

/// {@template light_theme}
/// Defines the ui of light theme
/// {@endtemplate}
final class LightTheme extends BaseTheme {
  /// {@macro light_theme}
  const LightTheme();

  @override
  String get name => 'light';

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle.dark;

  @override
  Color get scaffoldColor => AppColors.scaffoldBackgroundLight;

  @override
  Color get primaryColor => AppColors.primary600;

  @override
  Color get primaryColorLight => AppColors.primary500;

  @override
  Color get secondaryColor => AppColors.orange500;

  @override
  Color get secondaryColorLight => AppColors.orange400;

  @override
  Color get tertiaryColor => AppColors.green500;

  @override
  Color get tertiaryColorLight => AppColors.green400;

  @override
  Color get cardColor => AppColors.cardBackgroundLight;

  @override
  Color get linkColor => AppColors.blueDark600;

  @override
  Color get errorColor => AppColors.error600;

  @override
  List<BoxShadow> get cardShadow => AppShadows.xs();

  @override
  List<BoxShadow> get cardShadow2 => AppShadows.md();

  @override
  List<BoxShadow> get cardShadow3 => AppShadows.lg();

  @override
  Color get textColor1 => AppColors.gray700;

  @override
  Color get textColor2 => AppColors.gray600;

  @override
  Color get textColor3 => AppColors.gray500;

  @override
  AppButtonThemeData get buttonThemeData => const AppButtonThemeData(
        textColor: AppColors.white,
        primaryButtonColor: AppColors.green600,
      );

  @override
  InputTextThemeData get inputTextThemeData => const InputTextThemeData(
        borderSideColor: Color(0x40000000),
        focusedBorderSideColor: AppColors.primary500,
        iconColor: Color(0x99000000),
        errorColor: AppColors.error600,
      );

  @override
  CheckBoxListTileThemeData get checkBoxListTileThemeData =>
      const CheckBoxListTileThemeData(
        inactiveColor: AppColors.gray600,
        activeColor: AppColors.green500,
      );

  @override
  NavigationThemeData get navigationThemeData => NavigationThemeData(
        inactiveNavigationIconColor: AppColors.gray500,
        inactiveNavigationTitleColor: AppColors.gray700,
        activeHomeColor: AppColors.primary500,
        activeHomeTitleColor: AppColors.primary700,
        activeHistoryColor: AppColors.green500,
        activeHistoryTitleColor: AppColors.green600,
        activeDictionaryColor: AppColors.purple500,
        activeDictionaryTitleColor: AppColors.purple600,
        activeSettingsColor: AppColors.orange500,
        activeSettingsTitleColor: AppColors.orange600,
        sideNavigationBarShadow: AppShadows.md(),
      );

  @override
  AppSearchBarThemeData get searchBarThemeData => AppSearchBarThemeData(
        backgroundColor: AppColors.black.withAlpha(31),
        iconColor: const Color(0xFF4E4E4E),
        hintColor: const Color(0xFF727272),
      );

  @override
  SettingsThemeData get settingsThemeData => const SettingsThemeData(
        checkmarkColor: AppColors.green500,
        editUsernameColor: AppColors.primary500,
        editTranslatorColor: AppColors.warning500,
        settingsCheckmarkColor: AppColors.green400,
        switchActiveColor: AppColors.green500,
      );
}
