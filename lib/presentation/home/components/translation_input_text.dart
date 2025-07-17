import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/presentation/home/cubit/translation_input_text_cubit.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/theme/themes/light_theme.dart';
import 'package:qack/widgets/input/input.dart';

class TranslationInputText extends StatelessWidget {
  const TranslationInputText({super.key});

  @override
  Widget build(BuildContext context) {
    const minLines = 4;
    const maxLines = 6;

    return BlocProvider(
      create: (context) => TranslationInputTextCubit(minLines: minLines),
      child: const _TranslationInputText(
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}

class _TranslationInputText extends StatefulWidget {
  const _TranslationInputText({
    required this.minLines,
    required this.maxLines,
  });

  final int minLines;
  final int maxLines;

  @override
  State<_TranslationInputText> createState() => _TranslationInputTextState();
}

class _TranslationInputTextState extends State<_TranslationInputText> {
  late final TextEditingController textController;
  late final FocusNode translationFocusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    translationFocusNode = FocusNode()
      ..addListener(() {
        context.read<TranslationInputTextCubit>().updateFocus(
              translationFocusNode.hasFocus,
            );
      });
  }

  @override
  void dispose() {
    textController.dispose();
    translationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return BlocBuilder<TranslationInputTextCubit, TranslationInputTextState>(
      builder: (context, state) {
        return InputText(
          focusNode: translationFocusNode,
          controller: textController,
          suffixIcon: state.isFocused
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: state.alignmentHeightFactor,
                    widthFactor: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {
                        textController.clear();
                        context.read<HomeBloc>().add(
                              const HomeTextChanged(sourceText: ''),
                            );
                      },
                      child: Icon(
                        EvaIcons.closeSquareOutline,
                        color: theme.inputTextThemeData.iconColor,
                      ),
                    ),
                  ),
                )
              : null,
          maxLength: 6000,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          labelText: '',
          // TODO: Validate length based on enabled translators
          // 6000 characters for baidu
          validator: (_) => null,
          onChanged: (text) {
            final translatorSettings =
                context.read<SettingsBloc>().state.translatorSettings;

            if (translatorSettings != null &&
                translatorSettings.apiKeys.isNotEmpty) {
              context.read<HomeBloc>().add(HomeTextChanged(sourceText: text));

              // Count new lines for translation input
              context.read<TranslationInputTextCubit>().updateNewLineCount(
                    text.split('\n').length,
                    widget.maxLines, // maxLines
                  );
            }
          },
        );
      },
    );
  }
}
