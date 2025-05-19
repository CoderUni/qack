import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/theme/themes/light_theme.dart';
import 'package:vector_graphics/vector_graphics.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({required this.translationDetails, super.key});
  final BaseTranslationDetails translationDetails;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return LayoutHandler(
      mobile: MobileTranslationCard(
        translationDetails: translationDetails,
        cardMargin: const EdgeInsets.only(bottom: 16),
        cardPadding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        titleGap: 8,
        translationSpacing: 8,
        titleStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.textColor2,
            ),
        translatedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: theme.textColor1,
            ),
      ),
      tablet: TabletTranslationCard(
        translationDetails: translationDetails,
        cardMargin: const EdgeInsets.only(bottom: 16),
        cardPadding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        titleGap: 8,
        translationSpacing: 8,
        titleStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.textColor2,
            ),
        translatedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: theme.textColor1,
            ),
      ),
    );
  }
}

class MobileTranslationCard extends StatelessWidget {
  const MobileTranslationCard({
    required this.translationDetails,
    required this.cardMargin,
    required this.cardPadding,
    required this.titleGap,
    required this.translationSpacing,
    required this.titleStyle,
    required this.translatedTextStyle,
    super.key,
  });
  final BaseTranslationDetails translationDetails;

  final EdgeInsets cardMargin;
  final EdgeInsets cardPadding;

  final double titleGap;
  final double translationSpacing;

  final TextStyle titleStyle;
  final TextStyle translatedTextStyle;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Padding(
      padding: cardMargin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.cardColor,
          boxShadow: theme.cardShadow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: SvgPicture(
                      AssetBytesLoader(
                        translationDetails.svgPath,
                      ),
                    ),
                  ),
                  Gap(titleGap),
                  Text(
                    translationDetails.translatorName,
                    style: titleStyle,
                  ),
                  const Spacer(),
                ],
              ),
              Gap(translationSpacing),
              Text(
                translationDetails.translatedText.outputText,
                style: translatedTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabletTranslationCard extends StatelessWidget {
  const TabletTranslationCard({
    required this.translationDetails,
    required this.cardMargin,
    required this.cardPadding,
    required this.titleGap,
    required this.translationSpacing,
    required this.titleStyle,
    required this.translatedTextStyle,
    super.key,
  });
  final BaseTranslationDetails translationDetails;

  final EdgeInsets cardMargin;
  final EdgeInsets cardPadding;

  final double titleGap;
  final double translationSpacing;

  final TextStyle titleStyle;
  final TextStyle translatedTextStyle;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Padding(
      padding: cardMargin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.cardColor,
          boxShadow: theme.cardShadow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: SvgPicture(
                      AssetBytesLoader(
                        translationDetails.svgPath,
                      ),
                    ),
                  ),
                  Gap(titleGap),
                  Text(
                    translationDetails.translatorName,
                    style: titleStyle,
                  ),
                  const Spacer(),
                ],
              ),
              Gap(translationSpacing),
              Text(
                translationDetails.translatedText.outputText,
                style: translatedTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
