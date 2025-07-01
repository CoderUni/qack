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
import 'package:qack/widgets/app_bar/back_button_app_bar.dart';
import 'package:qack/widgets/input/input.dart';
import 'package:qack/widgets/input/input_switch.dart';
import 'package:vector_graphics/vector_graphics.dart';

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

  /// [TextEditingController] for DeepSeek API Key
  late final TextEditingController deepSeekApiKeyController;

  /// [TextEditingController] for Youdao App ID
  late final TextEditingController youDaoAppIDController;

  /// [TextEditingController] for Youdao Secret Key
  late final TextEditingController youDaoSecretKeyController;

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

    deepSeekApiKeyController = TextEditingController(
      text: apiKeys?[KeyNameConstants.deepSeek],
    );

    youDaoAppIDController = TextEditingController(
      text: apiKeys?[KeyNameConstants.youDaoAppID],
    );

    youDaoSecretKeyController = TextEditingController(
      text: apiKeys?[KeyNameConstants.youDaoSecretKey],
    );

    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    googleApiKeyController.dispose();
    baiduAppIDController.dispose();
    baiduSecretKeyController.dispose();
    deepSeekApiKeyController.dispose();
    youDaoAppIDController.dispose();
    youDaoSecretKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return Scaffold(
      appBar: BackButtonAppBar(
        showBackButton: false,
        onBack: Navigator.of(context).pop,
        title: 'Translator Settings',
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
                      deepSeekApiKey: deepSeekApiKeyController.text.trim(),
                      youDaoAppID: youDaoAppIDController.text.trim(),
                      youDaoSecretKey: youDaoSecretKeyController.text.trim(),
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
                    /* Google translate has not been implemented yet
                    Gap(widget.dividerSpacing * 3),
                    // TODO: Translate this into a reusable stateless widget
                    Row(
                      children: [
                        Text(
                          'Google',
                          style: widget.titleTextStyle,
                        ),
                        const Spacer(),
                        BlocBuilder<EnableTranslatorCubit,
                            Map<Translator, bool>>(
                          buildWhen: (previous, current) =>
                              previous[Translator.google] !=
                              current[Translator.google],
                          builder: (context, state) {
                            return AppSwitch(
                              value: state[Translator.google] ?? false,
                              onChanged: (value) => context
                                  .read<EnableTranslatorCubit>()
                                  .toggleTranslator(
                                    translator: Translator.google,
                                    value: value,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(widget.dividerSpacing),
                    BlocBuilder<EnableTranslatorCubit, Map<Translator, bool>>(
                      buildWhen: (previous, current) =>
                          previous[Translator.google] !=
                          current[Translator.google],
                      builder: (context, state) {
                        return InputText(
                          controller: googleApiKeyController,
                          maxLength: 100,
                          prefixIcon: SizedBox(
                            height: 48,
                            width: 48,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture(
                                AssetBytesLoader(
                                  Translator.google.svgPath,
                                ),
                              ),
                            ),
                          ),
                          labelText: 'Google Translate API Key',
                          // Validate google API key only if the
                          // Google translator is enabled
                          validator: state[Translator.google] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    */

                    Gap(widget.dividerSpacing * 3),
                    Row(
                      children: [
                        Text(
                          'Baidu',
                          style: widget.titleTextStyle,
                        ),
                        const Spacer(),
                        BlocBuilder<EnableTranslatorCubit,
                            Map<Translator, bool>>(
                          buildWhen: (previous, current) =>
                              previous[Translator.baidu] !=
                              current[Translator.baidu],
                          builder: (context, state) {
                            return AppSwitch(
                              value: state[Translator.baidu] ?? false,
                              onChanged: (value) => context
                                  .read<EnableTranslatorCubit>()
                                  .toggleTranslator(
                                    translator: Translator.baidu,
                                    value: value,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(widget.dividerSpacing),
                    BlocBuilder<EnableTranslatorCubit, Map<Translator, bool>>(
                      buildWhen: (previous, current) =>
                          previous[Translator.baidu] !=
                          current[Translator.baidu],
                      builder: (context, state) {
                        return InputText(
                          controller: baiduAppIDController,
                          maxLength: 100,
                          labelText: 'App ID',
                          prefixIcon: SizedBox(
                            height: 48,
                            width: 48,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture(
                                AssetBytesLoader(
                                  Translator.baidu.svgPath,
                                ),
                              ),
                            ),
                          ),
                          // Validate baidu app ID only if the Baidu
                          // translator is enabled
                          validator: state[Translator.baidu] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    Gap(widget.inputTextSpacing),
                    BlocBuilder<EnableTranslatorCubit, Map<Translator, bool>>(
                      buildWhen: (previous, current) =>
                          previous[Translator.baidu] !=
                          current[Translator.baidu],
                      builder: (context, state) {
                        return InputText(
                          controller: baiduSecretKeyController,
                          maxLength: 100,
                          labelText: 'Secret Key',
                          prefixIcon: const Icon(Icons.lock),
                          // Validate baidu access key only if the Baidu
                          // translator is enabled
                          validator: state[Translator.baidu] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    Gap(widget.dividerSpacing * 3),
                    Row(
                      children: [
                        Text(
                          'DeepSeek',
                          style: widget.titleTextStyle,
                        ),
                        const Spacer(),
                        BlocBuilder<EnableTranslatorCubit,
                            Map<Translator, bool>>(
                          buildWhen: (previous, current) =>
                              previous[Translator.deepSeek] !=
                              current[Translator.deepSeek],
                          builder: (context, state) {
                            return AppSwitch(
                              value: state[Translator.deepSeek] ?? false,
                              onChanged: (value) => context
                                  .read<EnableTranslatorCubit>()
                                  .toggleTranslator(
                                    translator: Translator.deepSeek,
                                    value: value,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(widget.dividerSpacing),
                    BlocBuilder<EnableTranslatorCubit, Map<Translator, bool>>(
                      buildWhen: (previous, current) =>
                          previous[Translator.deepSeek] !=
                          current[Translator.deepSeek],
                      builder: (context, state) {
                        return InputText(
                          controller: deepSeekApiKeyController,
                          maxLength: 100,
                          prefixIcon: SizedBox(
                            height: 48,
                            width: 48,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture(
                                AssetBytesLoader(
                                  Translator.deepSeek.svgPath,
                                ),
                              ),
                            ),
                          ),
                          labelText: 'DeepSeek API Key',
                          // Validate Deepseek API key only if the
                          // Deekseek is enabled
                          validator: state[Translator.deepSeek] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    Gap(widget.dividerSpacing * 3),
                    Row(
                      children: [
                        Text(
                          'Youdao',
                          style: widget.titleTextStyle,
                        ),
                        const Spacer(),
                        BlocBuilder<EnableTranslatorCubit,
                            Map<Translator, bool>>(
                          buildWhen: (previous, current) =>
                              previous[Translator.youDao] !=
                              current[Translator.youDao],
                          builder: (context, state) {
                            return AppSwitch(
                              value: state[Translator.youDao] ?? false,
                              onChanged: (value) => context
                                  .read<EnableTranslatorCubit>()
                                  .toggleTranslator(
                                    translator: Translator.youDao,
                                    value: value,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gap(widget.dividerSpacing),
                    BlocBuilder<EnableTranslatorCubit, Map<Translator, bool>>(
                      buildWhen: (previous, current) =>
                          previous[Translator.youDao] !=
                          current[Translator.youDao],
                      builder: (context, state) {
                        return InputText(
                          controller: youDaoAppIDController,
                          maxLength: 100,
                          labelText: 'App ID',
                          prefixIcon: SizedBox(
                            height: 48,
                            width: 48,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture(
                                AssetBytesLoader(
                                  Translator.youDao.svgPath,
                                ),
                              ),
                            ),
                          ),
                          // Validate baidu app ID only if the Baidu
                          // translator is enabled
                          validator: state[Translator.youDao] != true
                              ? (value) => null
                              : null,
                        );
                      },
                    ),
                    Gap(widget.inputTextSpacing),
                    BlocBuilder<EnableTranslatorCubit, Map<Translator, bool>>(
                      buildWhen: (previous, current) =>
                          previous[Translator.youDao] !=
                          current[Translator.youDao],
                      builder: (context, state) {
                        return InputText(
                          controller: youDaoSecretKeyController,
                          maxLength: 100,
                          labelText: 'Secret Key',
                          prefixIcon: const Icon(Icons.lock),
                          // Validate baidu access key only if the Baidu
                          // translator is enabled
                          validator: state[Translator.youDao] != true
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
