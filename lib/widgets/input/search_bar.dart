import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout.dart';
import 'package:qack/theme/theme.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.onChanged,
    this.hintText = 'Search Term',
    this.margin,
  });

  ///{@macro search_bar.on_changed}
  final void Function(String)? onChanged;

  /// {@macro search_bar.hint_text}
  final String hintText;

  /// {@macro search_bar.margin}
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return LayoutHandler(
      mobile: _BaseSearchBar(
        margin: margin ?? const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        contentSpacing: 8,
        onChanged: onChanged,
        hintText: hintText,
        textStyle: AppTextStyle.textMD.medium.copyWith(
          color: theme.textColor1,
        ),
        hintStyle: AppTextStyle.textMD.medium.copyWith(
          color: theme.searchBarThemeData.hintColor,
        ),
      ),
      tablet: _BaseSearchBar(
        margin: margin ?? const EdgeInsets.only(top: 8, bottom: 36),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        contentSpacing: 16,
        onChanged: onChanged,
        hintText: hintText,
        textStyle: AppTextStyle.textLG.medium.copyWith(
          color: theme.textColor1,
        ),
        hintStyle: AppTextStyle.textLG.medium.copyWith(
          color: theme.searchBarThemeData.hintColor,
        ),
      ),
    );
  }
}

class _BaseSearchBar extends StatelessWidget {
  const _BaseSearchBar({
    required this.hintText,
    required this.margin,
    required this.padding,
    required this.contentSpacing,
    required this.textStyle,
    required this.hintStyle,
    this.onChanged,
  });

  ///{@template search_bar.on_changed}
  /// Called when the [SearchBar] text changes
  /// {@endtemplate}
  final void Function(String)? onChanged;

  /// {@template search_bar.hint_text}
  /// Hint text of [SearchBar]
  /// {@endtemplate}
  final String hintText;

  /// {@template search_bar.margin}
  /// Margin of [SearchBar]
  /// {@endtemplate}
  final EdgeInsets margin;

  /// {@template search_bar.padding}
  /// Inner padding of [SearchBar]
  /// {@endtemplate}
  final EdgeInsets padding;

  /// {@template search_bar.content_spacing}
  /// Spacing between the search bar icon and the search bar text
  /// {@endtemplate}
  final double contentSpacing;

  final TextStyle textStyle;

  final TextStyle hintStyle;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return Padding(
      padding: margin,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: theme.searchBarThemeData.backgroundColor,
        ),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Icon(
                EvaIcons.search,
                size: 24,
                color: theme.searchBarThemeData.iconColor,
              ),
              Gap(contentSpacing),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  style: textStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: hintStyle,
                  ),
                  onTapOutside: (PointerDownEvent event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
