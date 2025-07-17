import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/history/models/models.dart';
import 'package:qack/presentation/settings/models/models.dart';
import 'package:qack/theme/theme.dart';
import 'package:vector_graphics/vector_graphics.dart';

class HistoryListTile extends StatefulWidget {
  const HistoryListTile({required this.translationHistory, super.key});
  final TranslationHistory translationHistory;

  @override
  State<HistoryListTile> createState() => _HistoryListTileState();
}

class _HistoryListTileState extends State<HistoryListTile> {
  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return LayoutHandler(
      mobile: HistoryListTileView(
        translationHistory: widget.translationHistory,
        theme: theme,
        cardMargin: const EdgeInsets.only(bottom: 16),
        cardPadding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        titleGap: 8,
        translationInputStyle: AppTextStyle.textMD.semiBold.copyWith(
          color: theme.textColor1,
        ),
        translationOutputStyle: AppTextStyle.textMD.medium.copyWith(
          color: theme.textColor1,
        ),
      ),
      tablet: HistoryListTileView(
        translationHistory: widget.translationHistory,
        theme: theme,
        cardMargin: const EdgeInsets.only(bottom: 16),
        cardPadding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        titleGap: 8,
        translationInputStyle: AppTextStyle.textMD.semiBold.copyWith(
          color: theme.textColor1,
        ),
        translationOutputStyle: AppTextStyle.textMD.medium.copyWith(
          color: theme.textColor1,
        ),
      ),
    );
  }
}

class HistoryListTileView extends StatelessWidget {
  const HistoryListTileView({
    required this.translationHistory,
    required this.theme,
    required this.cardMargin,
    required this.cardPadding,
    required this.titleGap,
    required this.translationInputStyle,
    required this.translationOutputStyle,
    super.key,
  });
  final TranslationHistory translationHistory;

  final BaseTheme theme;
  final EdgeInsets cardMargin;
  final EdgeInsets cardPadding;
  final double titleGap;
  final TextStyle translationInputStyle;
  final TextStyle translationOutputStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardMargin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.cardColor,
          boxShadow: theme.cardShadow,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translationHistory.input,
                style: translationInputStyle,
              ),
              ...List.generate(
                translationHistory.items?.length ?? 0,
                (index) {
                  final translator = translationHistory.items!
                      .elementAt(index)
                      .translator
                      .toTranslator();

                  late final EdgeInsets padding;

                  if (index == 0) {
                    padding = const EdgeInsets.only(top: 8, bottom: 12);
                  } else if (index == translationHistory.items!.length - 1) {
                    padding = const EdgeInsets.only(bottom: 8);
                  } else {
                    padding = const EdgeInsets.only(bottom: 12);
                  }

                  return Padding(
                    padding: padding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: SvgPicture(
                            AssetBytesLoader(
                              translator.svgPath,
                            ),
                          ),
                        ),
                        Gap(titleGap),
                        Expanded(
                          child: Text(
                            translationHistory.items!
                                .elementAt(index)
                                .output
                                .trim(),
                            style: translationOutputStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
