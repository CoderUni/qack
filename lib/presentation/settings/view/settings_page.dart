import 'package:flutter/material.dart';
import 'package:qack/presentation/settings/view/edit_translator_page.dart';
/*
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/settings/components/edit_settings_list_tile.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/utils/routes/slide_transition.dart';
import 'package:qack/widgets/divider.dart';
*/

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditTranslatorPage();
  }
}

/*
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return LayoutHandler(
      mobile: SettingsView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        expandedHeight: 200,
        usernameTextStyle:
            AppTextStyle.textLG.semiBold.copyWith(color: theme.textColor1),
        settingsListTileSpacing: 12,
      ),
      tablet: SettingsView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        expandedHeight: 250,
        usernameTextStyle:
            AppTextStyle.textXL.semiBold.copyWith(color: theme.textColor1),
        settingsListTileSpacing: 14,
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    required this.padding,
    required this.expandedHeight,
    required this.usernameTextStyle,
    required this.settingsListTileSpacing,
    super.key,
  });

  /// Padding of entire [SettingsView]
  final EdgeInsets padding;

  final double expandedHeight;

  final TextStyle usernameTextStyle;

  final double settingsListTileSpacing;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      'Settings',
                      style: AppTextStyle.displaySM.semiBold.copyWith(
                        color: theme.textColor1,
                      ),
                    ),
                    EditSettingsListTile(
                      color: theme.settingsThemeData.editUsernameColor,
                      icon: LucideIcons.edit,
                      title: 'Edit Username',
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: settingsListTileSpacing / 2,
                      ),
                      child: const AppDivider(),
                    ),
                    EditSettingsListTile(
                      color: theme.settingsThemeData.editTranslatorColor,
                      icon: Icons.translate_outlined,
                      title: 'Translator',
                      onTap: () => {
                        Navigator.of(context)
                            .push(slideHorizontal(const EditTranslatorPage())),
                      },
                    ),
                    Gap(settingsListTileSpacing),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
