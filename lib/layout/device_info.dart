import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/widgets.dart';

/// {@template layout_size}
/// Types of layout sizes
/// {@endtemplate}
enum LayoutSize {
  /// Mobile layout size
  mobile,

  /// Tablet layout size
  tablet,

  /// Desktop layout size
  desktop,
}

/// {@template device_platform}
/// Types of device platforms
/// {@endtemplate}
enum Platform {
  /// Android Platform
  android,

  /// Ios platform
  ios,

  /// Fuchsia platform
  fuchsia,

  /// Web platform
  web,

  /// Windows platform
  windows,

  /// Mac OS platform
  macOS,

  /// Linux platform
  linux,
}

/// Provides information about the current device
abstract class DeviceInfo {
  /// {@macro layout_size}
  static late LayoutSize layoutSize;

  ///{@macro device_platform}
  static final Platform devicePlatform = _devicePlatform;

  /// Current orientation of the device
  static late Orientation orientation;

  static Platform get _devicePlatform {
    if (kIsWeb) {
      return Platform.web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return Platform.android;
      case TargetPlatform.iOS:
        return Platform.ios;
      case TargetPlatform.windows:
        return Platform.windows;
      case TargetPlatform.macOS:
        return Platform.macOS;
      case TargetPlatform.linux:
        return Platform.linux;
      case TargetPlatform.fuchsia:
        return Platform.fuchsia;
    }
  }
}
