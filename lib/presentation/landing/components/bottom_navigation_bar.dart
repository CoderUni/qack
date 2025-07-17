import 'package:bottom_bar/bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/landing/components/components.dart';
import 'package:qack/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutHandler(
      mobile: _BottomNavBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        height: 56,
        itemPadding: const EdgeInsets.only(
          left: 14,
          right: 12,
          top: 6,
          bottom: 6,
        ),
        textStyle: AppTextStyle.textMD.medium,
        iconSize: 24,
      ),
      tablet: _BottomNavBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        height: 72,
        itemPadding: const EdgeInsets.only(
          left: 18,
          right: 15.5,
          top: 8,
          bottom: 8,
        ),
        textStyle: AppTextStyle.textLG.semiBold.copyWith(letterSpacing: 0.1),
        iconSize: 26,
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.mainAxisAlignment,
    required this.height,
    required this.itemPadding,
    required this.textStyle,
    required this.iconSize,
  });

  final MainAxisAlignment mainAxisAlignment;

  /// {@template bottom_nav_bar_height}
  /// The height of the bottom navigation bar.
  /// {@endtemplate}
  final double height;

  /// {@template bottom_nav_bar_item_padding}
  /// The padding of the [BottomBarItem].
  /// {@endtemplate}
  final EdgeInsets itemPadding;

  /// {@template bottom_nav_bar_item_text_style}
  /// The text style of each [BottomBarItem].
  /// {@endtemplate}
  final TextStyle textStyle;

  /// {@template bottom_nav_bar_item_icon_size}
  /// The size of all the [BottomBarItem] icons except for the home icon.
  /// {@endtemplate}
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    final navigationThemeData = theme.navigationThemeData;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            return BottomBar(
              onTap: (index) {
                final selectedPage = SelectedPage.values.elementAt(index);
                context
                    .read<BottomNavigationBarCubit>()
                    .changePage(selectedPage);
              },
              selectedIndex: state.selectedPage.index,
              backgroundColor: theme.cardColor,
              mainAxisAlignment: mainAxisAlignment,
              height: height,
              border: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              boxShadow: theme.cardShadow,
              itemPadding: itemPadding,
              textStyle: textStyle,
              items: [
                BottomBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: iconSize,
                  ),
                  title: const Text(
                    'Home',
                  ),
                  activeColor: navigationThemeData.activeHomeColor,
                  activeTitleColor: navigationThemeData.activeHomeTitleColor,
                  inactiveColor:
                      navigationThemeData.inactiveNavigationTitleColor,
                ),
                BottomBarItem(
                  icon: Icon(
                    Icons.history,
                    size: iconSize,
                  ),
                  title: const Text(
                    'History',
                  ),
                  activeColor: navigationThemeData.activeHistoryColor,
                  activeTitleColor: navigationThemeData.activeHistoryTitleColor,
                  inactiveColor:
                      navigationThemeData.inactiveNavigationTitleColor,
                ),
                BottomBarItem(
                  icon: Icon(
                    EvaIcons.bookOutline,
                    size: iconSize,
                  ),
                  title: const Text(
                    'Dictionary',
                  ),
                  activeColor: navigationThemeData.activeDictionaryColor,
                  activeTitleColor:
                      navigationThemeData.activeDictionaryTitleColor,
                  inactiveColor:
                      navigationThemeData.inactiveNavigationTitleColor,
                ),
                BottomBarItem(
                  icon: Icon(
                    EvaIcons.settings2Outline,
                    size: iconSize,
                  ),
                  title: const Text(
                    'Settings',
                  ),
                  activeColor: navigationThemeData.activeSettingsColor,
                  activeTitleColor:
                      navigationThemeData.activeSettingsTitleColor,
                  inactiveColor:
                      navigationThemeData.inactiveNavigationTitleColor,
                ),
              ],
            );
          },
        ),
        const SafeArea(
          top: false,
          child: SizedBox(),
        ),
      ],
    );
  }
}
