import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qack/theme/themes/models/models.dart';

/// {@template base_theme}
/// Template for creating custom themes
/// {@endtemplate}
abstract class BaseTheme {
  /// {@macro base_theme}
  const BaseTheme();

  /// Theme name
  String get name;

  /// Status bar settings
  SystemUiOverlayStyle get systemUiOverlayStyle;

  /// Background color of [Scaffold]
  Color get scaffoldColor;

  /// Primary color of app
  Color get primaryColor;

  /// Lighter primary color of app
  Color get primaryColorLight;

  /// Secondary color of app
  Color get secondaryColor;

  /// Light Secondary color of app
  Color get secondaryColorLight;

  /// Tertiary color of app
  Color get tertiaryColor;

  /// Light Tertiary color of app
  Color get tertiaryColorLight;

  /// Background color of [Card]
  Color get cardColor;

  /// Color of link
  Color get linkColor;

  /// Error color of app
  Color get errorColor;

  /// Shadow configuration of [Card] wiith low elevation
  List<BoxShadow> get cardShadow;

  /// Shadow configuration of [Card] with medium elevation
  List<BoxShadow> get cardShadow2;

  /// Shadow configuration of [Card] with high elevation
  List<BoxShadow> get cardShadow3;

  /// Dark color of text
  Color get textColor1;

  /// Regular color of text
  Color get textColor2;

  /// Light color of text
  Color get textColor3;

  /// {@macro app_button_theme_data}
  AppButtonThemeData get buttonThemeData;

  /// {@macro input_text_theme_data}
  InputTextThemeData get inputTextThemeData;

  /// {@macro check_box_list_tile_theme_data}
  CheckBoxListTileThemeData get checkBoxListTileThemeData;

  /// {@macro navigation_theme_data}
  NavigationThemeData get navigationThemeData;

  /// {@macro search_bar_theme_data}
  AppSearchBarThemeData get searchBarThemeData;

  /// {@macro settings_theme_data}
  SettingsThemeData get settingsThemeData;
}
