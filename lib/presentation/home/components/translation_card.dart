import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/theme/themes/light_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_graphics/vector_graphics.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({required this.translationDetails, super.key});
  final BaseTranslationDetails translationDetails;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return LayoutHandler(
      mobile: TranslationCardView(
        translationDetails: translationDetails,
        cardMargin: const EdgeInsets.only(bottom: 16),
        cardPadding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 4),
        titleGap: 8,
        translationMargin: const EdgeInsets.symmetric(vertical: 8),
        translationPadding: const EdgeInsets.all(8),
        titleStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.textColor2,
            ),
        translatedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: theme.textColor1,
            ),
      ),
      tablet: TranslationCardView(
        translationDetails: translationDetails,
        cardMargin: const EdgeInsets.only(bottom: 16),
        cardPadding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 4),
        titleGap: 8,
        translationMargin: const EdgeInsets.symmetric(vertical: 8),
        translationPadding: const EdgeInsets.all(8),
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

class TranslationCardView extends StatelessWidget {
  const TranslationCardView({
    required this.translationDetails,
    required this.cardMargin,
    required this.cardPadding,
    required this.titleGap,
    required this.translationMargin,
    required this.translationPadding,
    required this.titleStyle,
    required this.translatedTextStyle,
    super.key,
  });
  final BaseTranslationDetails translationDetails;

  final EdgeInsets cardMargin;
  final EdgeInsets cardPadding;

  final double titleGap;

  final EdgeInsets translationMargin;
  final EdgeInsets translationPadding;

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
              Padding(
                padding: translationMargin,
                child: InkWell(
                  onTap: () {
                    launchUrl(
                      Uri(
                        scheme: 'plecoapi',
                        host: 'x-callback-url',
                        path: 's',
                        queryParameters: {
                          'q': translationDetails.translatedText.outputText,
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: translationPadding,
                    child: Text(
                      translationDetails.translatedText.outputText,
                      style: translatedTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
