import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qack/layout/layout.dart';
import 'package:qack/theme/theme.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    required this.onBack,
    super.key,
    this.color,
    this.isFilled = false,
  });

  final Color? color;
  final bool isFilled;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return LayoutHandler(
      mobile: _BackButton(
        onBack: onBack,
        color: color,
        padding: const EdgeInsets.all(8),
        isFilled: isFilled,
        filledPadding: const EdgeInsets.all(6),
      ),
      tablet: _BackButton(
        onBack: onBack,
        color: color,
        padding: const EdgeInsets.all(12),
        isFilled: isFilled,
        filledPadding: const EdgeInsets.all(8),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.isFilled,
    required this.padding,
    required this.onBack,
    required this.filledPadding,
    this.color,
  });

  final Color? color;
  final bool isFilled;
  final EdgeInsets padding;
  final VoidCallback onBack;
  final EdgeInsets filledPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFilled ? filledPadding : EdgeInsets.zero,
      child: Material(
        shape: const CircleBorder(),
        color: isFilled
            ? AppColors.black.withValues(alpha: 0.15)
            : AppColors.transparent,
        child: InkWell(
          onTap: onBack,
          customBorder: const CircleBorder(),
          child: Padding(
            padding: padding,
            child: Icon(
              EvaIcons.arrowIosBack,
              color: color ?? AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
