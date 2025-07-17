import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/history/components/components.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/presentation/home/components/components.dart';
import 'package:qack/presentation/home/components/translation_input_text.dart';
import 'package:qack/presentation/home/cubit/translation_input_text_cubit.dart';
import 'package:qack/presentation/home/cubit/word_of_the_day_cubit.dart';
import 'package:qack/presentation/home/models/word_of_the_day/word_of_the_day.dart';
import 'package:qack/presentation/settings/bloc/settings_bloc.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/widgets/input/input.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHandler(
      mobile: HomeView(
        contentPadding: PaddingConstants.mobileHorizontalMargin,
        inputTextBottomPadding: 24,
      ),
      tablet: HomeView(
        contentPadding: PaddingConstants.tabletHorizontalMargin,
        inputTextBottomPadding: 24,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    required this.contentPadding,
    required this.inputTextBottomPadding,
    this.translateLabelPadding = const EdgeInsets.only(
      top: 16,
      bottom: 12,
    ),
    super.key,
  });

  final EdgeInsets contentPadding;
  final EdgeInsets translateLabelPadding;

  final double inputTextBottomPadding;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();

    return Scaffold(
      backgroundColor: theme.scaffoldColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: AppColors.primary450,
            flexibleSpace: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: contentPadding,
                    child: const WordOfTheDayWidget(),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: contentPadding,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: translateLabelPadding,
                  child: Text(
                    'Translate',
                    style: AppTextStyle.displaySM.semiBold.copyWith(
                      color: theme.textColor2,
                    ),
                  ),
                ),
                const TranslationInputText(),
                Gap(inputTextBottomPadding),
              ]),
            ),
          ),
          SliverPadding(
            padding: contentPadding,
            sliver: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.status == HomeStatus.initial ||
                    state.status == HomeStatus.empty) {
                  final translatorSettings =
                      context.read<SettingsBloc>().state.translatorSettings;
                  if (translatorSettings != null &&
                      translatorSettings.apiKeys.isNotEmpty) {
                    return BlocBuilder<HistoryBloc, HistoryState>(
                      buildWhen: (previous, current) =>
                          current.status != HistoryStatus.loading,
                      builder: (context, state) {
                        if (state.status == HistoryStatus.error) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text(
                                'Failed to load translation history',
                                style: AppTextStyle.displayXS.medium.copyWith(
                                  color: theme.errorColor,
                                ),
                              ),
                            ),
                          );
                        }
                    
                        if (state.history.isEmpty) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text(
                                'Get started by translating some text.',
                                style: AppTextStyle.displayXS.medium.copyWith(
                                  color: theme.textColor1,
                                ),
                              ),
                            ),
                          );
                        }
                    
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              // Temporary history
                              final translationHistory =
                                  state.filteredHistory[index];
                              return HistoryListTile(
                                translationHistory: translationHistory,
                              );
                            },
                            // Show only the first 3 items
                            childCount: state.filteredHistory.length < 3
                                ? state.filteredHistory.length
                                : 3,
                          ),
                        );
                      },
                    );
                  }

                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Go to the settings page to enable a translator '
                        'service.',
                        style: AppTextStyle.displayXS.medium.copyWith(
                          color: theme.errorColor,
                        ),
                      ),
                    ),
                  );
                }

                // Note: HomeStatus.loading represents that none of the
                // translations are completed yet.
                // HomeStatus.success represents that at least one
                // translation
                else if (state.status == HomeStatus.loading ||
                    state.status == HomeStatus.success) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return TranslationCard(
                          translationMapEntry:
                              state.translationDetails.entries.elementAt(index),
                          status: state.status,
                          exception: null,
                        );
                      },
                      childCount: state.translationDetails.length,
                    ),
                  );
                } else if (state.status == HomeStatus.error) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return TranslationCard(
                          translationMapEntry:
                              state.translationDetails.entries.elementAt(index),
                          status: state.status,
                          exception: state.exception,
                        );
                      },
                      childCount: state.translationDetails.length,
                    ),
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ),
        ],
      ),
    );
  }
}
