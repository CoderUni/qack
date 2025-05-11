import 'package:flutter/material.dart';
import 'package:qack/layout/layout.dart';
import 'package:qack/theme/theme.dart';

/// {@template custom_button}
/// Themed bare-bones button that allows padding adjustment
/// {@endtemplate}
class CustomButton extends StatelessWidget {
  /// {@macro custom_button}
  const CustomButton({
    required this.onTap,
    required this.title,
    super.key,
    this.isFilled = true,
    this.fillColor,
  });
  final VoidCallback onTap;
  final Widget title;
  final bool isFilled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return LayoutHandler(
      mobile: MobileCustomButton(
        onTap: onTap,
        title: title,
        isFilled: isFilled,
        fillColor: fillColor,
      ),
      tablet: TabletCustomButton(
        onTap: onTap,
        title: title,
        isFilled: isFilled,
        fillColor: fillColor,
      ),
    );
  }
}

class MobileCustomButton extends StatelessWidget {
  const MobileCustomButton({
    required this.onTap,
    required this.title,
    required this.isFilled,
    super.key,
    this.fillColor,
  });
  final VoidCallback onTap;
  final Widget title;

  final bool isFilled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      onTap: onTap,
      title: title,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      isFilled: isFilled,
      fillColor: fillColor,
    );
  }
}

class TabletCustomButton extends StatelessWidget {
  const TabletCustomButton({
    required this.onTap,
    required this.title,
    required this.isFilled,
    super.key,
    this.fillColor,
  });
  final VoidCallback onTap;
  final Widget title;

  final bool isFilled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      onTap: onTap,
      title: title,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      isFilled: isFilled,
      fillColor: fillColor,
    );
  }
}

class _BaseButton extends StatelessWidget {
  const _BaseButton({
    required this.onTap,
    required this.padding,
    required this.title,
    required this.isFilled,
    this.fillColor,
  });

  final VoidCallback onTap;
  final EdgeInsets padding;
  final Widget title;

  final bool isFilled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return RawMaterialButton(
      fillColor: isFilled
          ? fillColor ?? theme.buttonThemeData.primaryButtonColor
          : null,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onPressed: onTap,
      child: Padding(
        padding: padding,
        child: title,
      ),
    );
  }
}
