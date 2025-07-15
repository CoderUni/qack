import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/history/repositories/history_repository.dart';
import 'package:qack/presentation/settings/models/translator_details.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/utils/database/database.dart';
import 'package:qack/widgets/input/input.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHandler(
      mobile: HistoryView(
        searchBarPadding: EdgeInsets.only(
          top: 16,
          left: PaddingConstants.mobileHorizontalMarginValue,
          right: PaddingConstants.mobileHorizontalMarginValue,
        ),
      ),
      tablet: HistoryView(
        searchBarPadding: EdgeInsets.only(
          top: 24,
          left: PaddingConstants.tabletHorizontalMarginValue,
          right: PaddingConstants.tabletHorizontalMarginValue,
        ),
      ),
    );
  }
}

class HistoryView extends StatefulWidget {
  const HistoryView({required this.searchBarPadding, super.key});

  final EdgeInsets searchBarPadding;

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: widget.searchBarPadding,
              sliver: SliverToBoxAdapter(
                child: AppSearchBar(
                  onChanged: (query) {
                    context.read<HistoryBloc>().add(HistoryFiltered(query));
                  },
                  hintText: 'Search',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: BlocBuilder<HistoryBloc, HistoryState>(
                buildWhen: (previous, current) =>
                    current.status != HistoryStatus.loading,
                builder: (context, state) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (state.status == HistoryStatus.error) {
                          return Center(
                            child: Text(
                              'Failed to load history',
                              // TODO: Change the textstyle
                              style: AppTextStyle.textMD.medium.copyWith(
                                color: theme.errorColor,
                              ),
                            ),
                          );
                        } else if (state.filteredHistory.isEmpty) {
                          // TODO: only show this text if history and filter
                          // are empty
                          return const Center(
                            child: Text('No history available'),
                          );
                        }

                        // Temporary history
                        final translationHistory = state.filteredHistory[index];
                        return ListTile(
                          title: Text(translationHistory.input),
                          subtitle: Text(
                            translationHistory.items
                                    ?.map(
                                      (item) =>
                                          '${item.translator.toTranslator()}: '
                                          '${item.output}',
                                    )
                                    .join('\n\n') ??
                                '',
                          ),
                        );
                      },
                      childCount: state.filteredHistory.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
