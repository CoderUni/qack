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

  /// Active color of settings navigation item
  final Color activeSettingsColor;

  /// Active color of settings navigation title
  final Color activeSettingsTitleColor;

  /// Shadow to cast on side navigation bar
  final List<BoxShadow> sideNavigationBarShadow;
}
