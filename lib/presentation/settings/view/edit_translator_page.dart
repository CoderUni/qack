import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/presentation/settings/cubit/enable_translator_cubit.dart';
import 'package:qack/presentation/settings/models/models.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/theme/themes/light_theme.dart';
import 'package:qack/widgets/divider.dart';
import 'package:qack/widgets/input/input.dart';
import 'package:qack/widgets/input/input_switch.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:qack/widgets/app_bar/back_button_app_bar.dart';

class EditTranslatorPage extends StatelessWidget {
  const EditTranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return MultiBlocProvider(
      providers: [
        BlocProvider<EnableTranslatorCubit>(
          create: (context) => EnableTranslatorCubit(
            context
                .read<SettingsBloc>()
                .state
                .translatorSettings
                ?.enabledTranslators,
          ),
        ),
      ],
      child: LayoutHandler(
        mobile: MobileTranslatorPage(
          dividerSpacing: 8,
          inputTextSpacing: 12,
          titleTextStyle: AppTextStyle.textLG.bold.copyWith(
            color: theme.textColor2,
          ),
        ),
        tablet: const TabletTranslatorPage(),
      ),
    );
  }
}

class MobileTranslatorPage extends StatefulWidget {
  const MobileTranslatorPage({
    required this.dividerSpacing,
    required this.inputTextSpacing,
    required this.titleTextStyle,
    super.key,
  });

  final double dividerSpacing;
  final double inputTextSpacing;

  /// Text style for the title
  final TextStyle titleTextStyle;

  @override
  State<MobileTranslatorPage> createState() => _MobileTranslatorPageState();
}

class _MobileTranslatorPageState extends State<MobileTranslatorPage> {
  final formKey = GlobalKey<FormState>();

  /// [TextEditingController] for Google API Key
  late final TextEditingController googleApiKeyController;

  /// [TextEditingController] for Baidu App ID
  late final TextEditingController baiduAppIDController;

  /// [TextEditingController] for Baidu Secret Key
  late final TextEditingController baiduSecretKeyController;

  @override
  void initState() {
    final apiKeys =
        context.read<SettingsBloc>().state.translatorSettings?.apiKeys;

    // Set the initial values for the controllers
    googleApiKeyController = TextEditingController(
      text: apiKeys?[KeyNameConstants.google],
    );

    baiduAppIDController = TextEditingController(
      text: apiKeys?[KeyNameConstants.baiduAppID],
    );

    baiduSecretKeyController = TextEditingController(
      text: apiKeys?[KeyNameConstants.baiduSecretKey],
    );

    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    googleApiKeyController.dispose();
    baiduAppIDController.dispose();
    baiduSecretKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return Scaffold(
      appBar: BackButtonAppBar(
        onBack: Navigator.of(context).pop,
        title: 'Edit Translator',
        actions: [
          InkWell(
            customBorder: const CircleBorder(),
            splashColor: theme.settingsThemeData.settingsCheckmarkColor,
            focusColor: theme.settingsThemeData.settingsCheckmarkColor,
            hoverColor: theme.settingsThemeData.settingsCheckmarkColor,
            highlightColor: theme.settingsThemeData.settingsCheckmarkColor,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(LucideIcons.check),
            ),
            onTap: () {
              final enableTranslators = context
                  .read<EnableTranslatorCubit>()
                  .state
                  .entries
                  .where((element) => element.value)
                  .map((e) => e.key)
                  .toList();

              context.read<SettingsBloc>().add(
                    SettingsEditTranslator(
                      formKey: formKey,
                      enabledTranslators: enableTranslators,
                      googleApiKey: googleApiKeyController.text.trim(),
                      baiduAppID: baiduAppIDController.text.trim(),
                      baiduSecretKey: baiduSecretKeyController.text.trim(),
                    ),
                  );
            },
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Gap(widget.dividerSpacing * 3),
                    Row(
                      children: [
                        Text(
                          'Google',
                          style: widget.titleTextStyle,
                        ),
                        const Spacer(),
                        BlocBuilder<EnableTranslatorCubit,
                            Map<TranslatorApp, bool>>(
                          buildWhen: (previous, current) =>
                              previous[TranslatorApp.google] !=
                              current[TranslatorApp.google],
                          builder: (context, state) {
                            return AppSwitch(
                              value: state[TranslatorApp.google] ?? false,
                              onChanged: (value) => context
                                  .read<EnableTranslatorCubit>()
                                  .toggleTranslator(
                                    translator: TranslatorApp.google,
                                    value: value,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(widget.dividerSpacing),
                    BlocBuilder<EnableTranslatorCubit,
                        Map<TranslatorApp, bool>>(
                      buildWhen: (previous, current) =>
                          previous[TranslatorApp.google] !=
                          current[TranslatorApp.google],
                      builder: (context, state) {
                        return InputText(
                          controller: googleApiKeyController,
                          maxLength: 100,
                          prefixIcon: const SizedBox(
                            height: 48,
                            width: 48,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture(
                                AssetBytesLoader(
                                  'assets/images/google_icon.svg.vec',
                                ),
                              ),
                            ),
                          ),
                          labelText: 'Google Translate',
                          // Validate google API key only if the
                          // Google translator is enabled
                          validator: state[TranslatorApp.google] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    Gap(widget.dividerSpacing * 3),
                    Row(
                      children: [
                        Text(
                          'Baidu',
                          style: widget.titleTextStyle,
                        ),
                        const Spacer(),
                        BlocBuilder<EnableTranslatorCubit,
                            Map<TranslatorApp, bool>>(
                          buildWhen: (previous, current) =>
                              previous[TranslatorApp.baidu] !=
                              current[TranslatorApp.baidu],
                          builder: (context, state) {
                            return AppSwitch(
                              value: state[TranslatorApp.baidu] ?? false,
                              onChanged: (value) => context
                                  .read<EnableTranslatorCubit>()
                                  .toggleTranslator(
                                    translator: TranslatorApp.baidu,
                                    value: value,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(widget.dividerSpacing),
                    BlocBuilder<EnableTranslatorCubit,
                        Map<TranslatorApp, bool>>(
                      buildWhen: (previous, current) =>
                          previous[TranslatorApp.baidu] !=
                          current[TranslatorApp.baidu],
                      builder: (context, state) {
                        return InputText(
                          controller: baiduAppIDController,
                          maxLength: 100,
                          labelText: 'App ID',
                          prefixIcon: const SizedBox(
                            height: 48,
                            width: 48,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture(
                                AssetBytesLoader(
                                  'assets/images/baidu_icon.svg.vec',
                                ),
                              ),
                            ),
                          ),
                          // Validate baidu app ID only if the Baidu
                          // translator is enabled
                          validator: state[TranslatorApp.baidu] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    Gap(widget.inputTextSpacing),
                    BlocBuilder<EnableTranslatorCubit,
                        Map<TranslatorApp, bool>>(
                      buildWhen: (previous, current) =>
                          previous[TranslatorApp.baidu] !=
                          current[TranslatorApp.baidu],
                      builder: (context, state) {
                        return InputText(
                          controller: baiduSecretKeyController,
                          maxLength: 100,
                          labelText: 'Secret Key',
                          prefixIcon: const Icon(Icons.lock),
                          // Validate baidu access key only if the Baidu
                          // translator is enabled
                          validator: state[TranslatorApp.baidu] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
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

class TabletTranslatorPage extends StatelessWidget {
  const TabletTranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackButtonAppBar(
        onBack: Navigator.of(context).pop,
        title: 'Edit Translator',
      ),
      body: const Center(
        child: Text('Mobile Translator Page'),
      ),
    );
  }
}
