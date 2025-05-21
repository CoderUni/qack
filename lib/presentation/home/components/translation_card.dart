import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:qack/presentation/home/repositories/repositories.dart';
import 'package:qack/presentation/settings/models/models.dart';
import 'package:qack/theme/themes/light_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_graphics/vector_graphics.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({
    required this.status,
    required this.translationMapEntry,
    required this.exception,
    super.key,
  });
  final HomeStatus status;
  final MapEntry<Translator, BaseTranslationDetails> translationMapEntry;

  /// This error is a general error in [HomeRepository]'s translateText method.
  /// It is not a translation error.
  /// See [BaseTranslationError] or [BaseTranslationDetails] .empty methods for
  /// translation errors.
  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return LayoutHandler(
      mobile: TranslationCardView(
        status: status,
        translator: translationMapEntry.key,
        translationDetails: translationMapEntry.value,
        exception: exception,
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
        status: status,
        translator: translationMapEntry.key,
        translationDetails: translationMapEntry.value,
        exception: exception,
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
    required this.status,
    required this.translator,
    required this.translationDetails,
    required this.cardMargin,
    required this.cardPadding,
    required this.titleGap,
    required this.translationMargin,
    required this.translationPadding,
    required this.titleStyle,
    required this.translatedTextStyle,
    required this.exception,
    super.key,
  });
  final HomeStatus status;
  final Exception? exception;

  final Translator translator;
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
    var translationStyle = translatedTextStyle;
    late final String translationText;

    switch (status) {
      case HomeStatus.initial:
      case HomeStatus.empty:
        translationText = 'Empty translation.';
      case HomeStatus.loading:
        translationText = 'Loading...';
      case HomeStatus.success:
        // Check if the translation is empty
        if (translationDetails is EmptyTranslationDetails) {
          translationText = 'Loading...';
          break;
        }

        if (translationDetails.status == TranslationStatus.loading) {
          translationText = 'Loading...';
        } else if (translationDetails.status == TranslationStatus.success) {
          translationText = translationDetails.translatedText!.outputText;
        } else if (translationDetails.status == TranslationStatus.error ||
            translationDetails.exception != null) {
          translationText =
              'Translation error: ${translationDetails.exception}';
        } else {
          translationText = 'Unknown error';
        }
      case HomeStatus.error:
        translationStyle = translatedTextStyle.copyWith(
          color: theme.errorColor,
        );
        translationText = 'Error: $exception';
    }

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
                        translator.svgPath,
                      ),
                    ),
                  ),
                  Gap(titleGap),
                  Text(
                    translator.name,
                    style: titleStyle,
                  ),
                  const Spacer(),
                ],
              ),
              Padding(
                padding: translationMargin,
                child: InkWell(
                  onTap: () {
                    if (status == HomeStatus.success &&
                        translationDetails.translatedText != null) {
                      launchUrl(
                        Uri(
                          scheme: 'plecoapi',
                          host: 'x-callback-url',
                          path: 's',
                          queryParameters: {
                            'q': translationText,
                          },
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: translationPadding,
                    child: Text(
                      translationText,
                      style: translationStyle,
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
