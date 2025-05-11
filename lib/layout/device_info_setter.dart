import 'package:flutter/material.dart';
import 'package:qack/layout/layout.dart';

/// {@template device_info_setter}
/// A wrapper around [LayoutBuilder] and [OrientationBuilder] which sets
/// the `DeviceInfo`
/// {@endtemplate}
class DeviceInfoSetter extends StatelessWidget {
  /// {@macro device_info_setter}
  const DeviceInfoSetter({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        if (screenWidth < DeviceBreakpoints.small) {
          DeviceInfo.layoutSize = LayoutSize.mobile;
        } else if (screenWidth < DeviceBreakpoints.medium) {
          DeviceInfo.layoutSize = LayoutSize.tablet;
        } else {
          DeviceInfo.layoutSize = LayoutSize.desktop;
        }

        return OrientationBuilder(
          builder: (context, orientation) {
            DeviceInfo.orientation = orientation;
            return child;
          },
        );
      },
    );
  }
}
