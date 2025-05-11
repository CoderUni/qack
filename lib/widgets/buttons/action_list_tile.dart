import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/theme/theme.dart';

class ActionListTile extends StatelessWidget {
  ActionListTile({
    required this.color,
    required this.prefixIcon,
    required this.title,
    required this.onTap,
    super.key,
    this.suffixIcon,
  }) : colorWithOpacity = color.withValues(alpha: 0.2);

  final Color color;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String title;
  final VoidCallback onTap;
  final Color colorWithOpacity;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return LayoutHandler(
      mobile: ActionListTileView(
        color: color,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        title: title,
        onTap: onTap,
        colorWithOpacity: colorWithOpacity,
        titleStyle:
            AppTextStyle.textLG.medium.copyWith(color: theme.textColor2),
        iconPadding: const EdgeInsets.all(8),
        iconSize: 24,
        iconTitleGap: 16,
      ),
      tablet: ActionListTileView(
        color: color,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        title: title,
        onTap: onTap,
        colorWithOpacity: colorWithOpacity,
        titleStyle:
            AppTextStyle.textXL.medium.copyWith(color: theme.textColor2),
        iconPadding: const EdgeInsets.all(12),
        iconSize: 32,
        iconTitleGap: 24,
      ),
    );
  }
}

class ActionListTileView extends StatelessWidget {
  const ActionListTileView({
    required this.color,
    required this.prefixIcon,
    required this.title,
    required this.onTap,
    required this.colorWithOpacity,
    required this.titleStyle,
    required this.iconPadding,
    required this.iconSize,
    required this.iconTitleGap,
    super.key,
    this.suffixIcon,
  });

  final Color color;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String title;
  final VoidCallback onTap;
  final Color colorWithOpacity;
  final TextStyle titleStyle;
  final EdgeInsets iconPadding;
  final double iconSize;

  /// The gap between icon and title
  final double iconTitleGap;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return InkWell(
      highlightColor: colorWithOpacity,
      focusColor: colorWithOpacity,
      splashColor: colorWithOpacity,
      hoverColor: colorWithOpacity,
      customBorder: const StadiumBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorWithOpacity,
              ),
              child: Padding(
                padding: iconPadding,
                child: IconTheme(
                  data: IconThemeData(
                    color: color,
                    size: iconSize,
                  ),
                  child: prefixIcon,
                ),
              ),
            ),
            Gap(iconTitleGap),
            AutoSizeText(
              title,
              style: titleStyle,
            ),
            const Spacer(),
            if (suffixIcon != null)
              IconTheme(
                data: IconThemeData(
                  color: theme.textColor2,
                  size: iconSize,
                ),
                child: suffixIcon!,
              ),
          ],
        ),
      ),
    );
  }
}
