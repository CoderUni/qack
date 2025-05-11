import 'package:flutter/material.dart';

/// {@template navigation_theme_data}
/// Stores navigation bar theme configuration
/// {@endtemplate}
class NavigationThemeData {
  /// {@macro navigation_theme_data}
  const NavigationThemeData({
    required this.inactiveNavigationIconColor,
    required this.inactiveNavigationTitleColor,
    required this.activeMenuColor,
    required this.activeMenuTitleColor,
    required this.activeOrderColor,
    required this.activeOrderTitleColor,
    required this.sideNavigationBarShadow,
  });

  /// Inactive color of navigation bar icon
  final Color inactiveNavigationIconColor;

  /// Inactive color of navigation bar title
  final Color inactiveNavigationTitleColor;

  /// Active color of menu navigation item
  final Color activeMenuColor;

  /// Active color of menu navigation title
  final Color activeMenuTitleColor;

  /// Active color of order navigation item
  final Color activeOrderColor;

  /// Active color of order navigation title
  final Color activeOrderTitleColor;

  /// Shadow to cast on side navigation bar
  final List<BoxShadow> sideNavigationBarShadow;
}
