import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/widgets/input/cubit/check_box_list_tile_cubit.dart';
class AppCheckBoxListTile extends StatelessWidget {
  AppCheckBoxListTile({
    required this.color,
    required this.activeColor,
    required this.title,
    required this.onTap,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
  }) : colorWithOpacity = color.withAlpha(51);

  /// Color of title and inactive checkbox icon
  final Color color;

  /// Color of active checkbox icon
  final Color activeColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String title;
  final VoidCallback onTap;
  final Color colorWithOpacity;

  @override
  Widget build(BuildContext context) {
    return LayoutHandler(
      mobile: AppCheckBoxListTileView(
        color: color,
        activeColor: activeColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        title: title,
        onTap: onTap,
        colorWithOpacity: colorWithOpacity,
        titleStyle: const TextStyle(
          fontSize: 18,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF475467),
        ),
        iconPadding: const EdgeInsets.all(8),
        iconSize: 24,
        iconTitleGap: 16,
      ),
      tablet: AppCheckBoxListTileView(
        color: color,
        activeColor: activeColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        title: title,
        onTap: onTap,
        colorWithOpacity: colorWithOpacity,
        titleStyle: const TextStyle(
          fontSize: 20,
          letterSpacing: 0,
          color: Color(0xFF475467),
          fontWeight: FontWeight.w500,
        ),
        iconPadding: const EdgeInsets.all(12),
        iconSize: 32,
        iconTitleGap: 24,
      ),
    );
  }
}

class AppCheckBoxListTileView extends StatelessWidget {
  const AppCheckBoxListTileView({
    required this.color,
    required this.activeColor,
    required this.title,
    required this.onTap,
    required this.colorWithOpacity,
    required this.titleStyle,
    required this.iconPadding,
    required this.iconSize,
    required this.iconTitleGap,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
  });

  final Color color;
  final Color activeColor;
  final Widget? prefixIcon;
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
    final isSelected = context.read<CheckBoxListTileCubit>().state;

    return InkWell(
      highlightColor: colorWithOpacity,
      focusColor: colorWithOpacity,
      splashColor: colorWithOpacity,
      hoverColor: colorWithOpacity,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            if (prefixIcon != null)
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
                    child: prefixIcon!,
                  ),
                ),
              ),
            if (prefixIcon != null) Gap(iconTitleGap),
            AutoSizeText(
              title,
              style: titleStyle,
            ),
            const Spacer(),
            IconTheme(
              data: IconThemeData(
                color: const Color(0xFF475467),
                size: iconSize,
              ),
              child: suffixIcon ??
                  (isSelected
                      ? Icon(Icons.check_box_rounded, color: activeColor)
                      : Icon(
                          Icons.check_box_outline_blank_rounded,
                          color: color,
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
