import 'package:flutter/material.dart';

/// {@template navigation_theme_data}
/// Stores navigation bar theme configuration
/// {@endtemplate}
class NavigationThemeData {
  /// {@macro navigation_theme_data}
  const NavigationThemeData({
    required this.inactiveNavigationIconColor,
    required this.inactiveNavigationTitleColor,
    required this.activeHomeColor,
    required this.activeHomeTitleColor,
    required this.activeHistoryColor,
    required this.activeHistoryTitleColor,
    required this.activeDictionaryColor,
    required this.activeDictionaryTitleColor,
    required this.activeSettingsColor,
    required this.activeSettingsTitleColor,
    required this.sideNavigationBarShadow,
  });

  /// Inactive color of navigation bar icon
  final Color inactiveNavigationIconColor;

  /// Inactive color of navigation bar title
  final Color inactiveNavigationTitleColor;

  /// Active color of home navigation item
  final Color activeHomeColor;

  /// Active color of home navigation title
  final Color activeHomeTitleColor;

  /// Active color of history navigation item
  final Color activeHistoryColor;

  /// Active color of history navigation title
  final Color activeHistoryTitleColor;

  /// Active color of dictionary navigation item
  final Color activeDictionaryColor;

  /// Active color of dictionary navigation title
  final Color activeDictionaryTitleColor;

  /// Active color of settings navigation item
  final Color activeSettingsColor;

  /// Active color of settings navigation title
  final Color activeSettingsTitleColor;

  /// Shadow to cast on side navigation bar
  final List<BoxShadow> sideNavigationBarShadow;
}
