import 'package:flutter/material.dart';
import 'package:qack/layout/layout.dart';

/// {@template layout_handler}
/// Displays the corresponding widget according to layout size
/// {@endtemplate}
class LayoutHandler extends StatelessWidget {
  /// {@macro layout_handler}
  const LayoutHandler({
    required this.mobile,
    required this.tablet,
    super.key,
  });

  /// Widget to display for a mobile layout
  final Widget mobile;

  /// Widget to display for a tablet layout
  final Widget tablet;

  /// Widget to display for a desktop layout
  /// This will return tablet layout for now,
  /// since we're not supporting desktop yet
  // final Widget desktop;

  @override
  Widget build(BuildContext context) {
    switch (DeviceInfo.layoutSize) {
      case LayoutSize.mobile:
        return mobile;
      case LayoutSize.tablet:
        return tablet;
      case LayoutSize.desktop:
        return tablet;
    }
  }
}
