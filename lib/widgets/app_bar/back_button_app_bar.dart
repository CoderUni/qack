import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qack/layout/layout.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/widgets/buttons/buttons.dart';

class BackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackButtonAppBar({
    required this.onBack,
    super.key,
    this.title,
    this.actions,
    this.showBackButton = true,
  });

  final VoidCallback onBack;
  final String? title;
  final List<Widget>? actions;

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return LayoutHandler(
      mobile: BackButtonAppBarView(
        onBack: onBack,
        title: title,
        titleStyle:
            AppTextStyle.textLG.semiBold.copyWith(color: theme.textColor1),
        actions: actions,
        showBackButton: showBackButton,
      ),
      tablet: BackButtonAppBarView(
        onBack: onBack,
        title: title,
        titleStyle:
            AppTextStyle.textXL.semiBold.copyWith(color: theme.textColor1),
        actions: actions,
        showBackButton: showBackButton,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BackButtonAppBarView extends StatelessWidget {
  const BackButtonAppBarView({
    required this.onBack,
    required this.titleStyle,
    required this.showBackButton,
    super.key,
    this.title,
    this.actions,
  });

  final VoidCallback onBack;
  final String? title;

  final TextStyle titleStyle;

  final List<Widget>? actions;

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return AppBar(
      backgroundColor: AppColors.transparent,
      leading: showBackButton
          ? AppBackButton(
              onBack: onBack,
              color: theme.textColor1,
            )
          : null,
      title: title != null
          ? AutoSizeText(
              title!,
              style: titleStyle,
            )
          : null,
      centerTitle: true,
      actions: actions,
    );
  }
}
