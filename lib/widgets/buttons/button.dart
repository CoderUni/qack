import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qack/layout/layout.dart';
import 'package:qack/theme/theme.dart';

/// {@template button}
/// Themed button used throughout the app
/// {@endtemplate}
class Button extends StatelessWidget {
  /// {@macro button}
  const Button({
    required this.onTap,
    required this.title,
    super.key,
    this.isDisabled = false,
    this.isTitleBold = false,
    this.isFilled = true,
    this.fillColor,
    this.textColor,
    this.textStyle,
  });

  /// If **true**, the button will have a disabled button appearance.
  ///
  /// **Take note** that this isn't a disabled button. It's just a button that
  /// looks like a disabled button.
  final bool isDisabled;
  final VoidCallback onTap;
  final String title;
  final bool isTitleBold;
  final bool isFilled;
  final Color? fillColor;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return LayoutHandler(
      mobile: MobileButton(
        isDisabled: isDisabled,
        onTap: onTap,
        title: title,
        isTitleBold: isTitleBold,
        isFilled: isFilled,
        fillColor: fillColor,
        textColor: textColor,
        textStyle: textStyle,
      ),
      tablet: TabletButton(
        isDisabled: isDisabled,
        onTap: onTap,
        title: title,
        isTitleBold: isTitleBold,
        isFilled: isFilled,
        fillColor: fillColor,
        textColor: textColor,
        textStyle: textStyle,
      ),
    );
  }
}

class MobileButton extends StatelessWidget {
  const MobileButton({
    required this.isDisabled,
    required this.onTap,
    required this.title,
    required this.isTitleBold,
    required this.isFilled,
    super.key,
    this.fillColor,
    this.textColor,
    this.textStyle,
  });
  final bool isDisabled;
  final VoidCallback onTap;
  final String title;
  final bool isTitleBold;
  final bool isFilled;
  final Color? fillColor;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      isDisabled: isDisabled,
      onTap: onTap,
      title: title,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      titleTextStyle: textStyle ??
          (isTitleBold
              ? AppTextStyle.textMD.bold.copyWith(
                  color: textColor ?? AppColors.white,
                )
              : AppTextStyle.textMD.medium.copyWith(
                  color: textColor ?? AppColors.white,
                )),
      isFilled: isFilled,
      fillColor: fillColor,
    );
  }
}

class TabletButton extends StatelessWidget {
  const TabletButton({
    required this.isDisabled,
    required this.onTap,
    required this.title,
    required this.isTitleBold,
    required this.isFilled,
    super.key,
    this.fillColor,
    this.textColor,
    this.textStyle,
  });
  final bool isDisabled;
  final VoidCallback onTap;
  final String title;
  final bool isTitleBold;
  final bool isFilled;
  final Color? fillColor;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      isDisabled: isDisabled,
      onTap: onTap,
      title: title,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      titleTextStyle: textStyle ??
          (isTitleBold
              ? AppTextStyle.textLG.bold.copyWith(
                  color: textColor ?? AppColors.white,
                  letterSpacing: 0.4,
                )
              : AppTextStyle.textLG.medium.copyWith(
                  color: textColor ?? AppColors.white,
                )),
      isFilled: isFilled,
      fillColor: fillColor,
    );
  }
}

class _BaseButton extends StatelessWidget {
  const _BaseButton({
    required this.isDisabled,
    required this.onTap,
    required this.padding,
    required this.title,
    required this.titleTextStyle,
    required this.isFilled,
    this.fillColor,
  });

  final bool isDisabled;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final String title;
  final TextStyle titleTextStyle;
  final bool isFilled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    late final Color? buttonFillColor;

    if (isFilled) {
      if (fillColor != null) {
        buttonFillColor = Color.lerp(
          fillColor,
          AppColors.grayTrue400,
          isDisabled ? 0.5 : 0,
        );
      } else {
        buttonFillColor = Color.lerp(
          theme.buttonThemeData.primaryButtonColor,
          AppColors.grayTrue400,
          isDisabled ? 0.5 : 0,
        );
      }
    } else {
      buttonFillColor = null;
    }

    return RawMaterialButton(
      fillColor: buttonFillColor,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onPressed: onTap,
      child: Padding(
        padding: padding,
        child: AutoSizeText(
          title,
          maxLines: 1,
          style: titleTextStyle,
        ),
      ),
    );
  }
}
