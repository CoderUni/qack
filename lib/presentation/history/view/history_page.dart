import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/history/components/history_list_tile.dart';
import 'package:qack/theme/theme.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: BlocBuilder<HistoryBloc, HistoryState>(
                buildWhen: (previous, current) =>
                    current.status != HistoryStatus.loading,
                builder: (context, state) {
                  if (state.status == HistoryStatus.error) {
                    return Center(
                      child: Text(
                        'Failed to load history',
                        style: AppTextStyle.displayXS.medium.copyWith(
                          color: theme.errorColor,
                        ),
                      ),
                    );
                  } else if (state.history.isEmpty) {
                    return Center(
                      child: Text(
                        'No history available',
                        style: AppTextStyle.displayXS.medium.copyWith(
                          color: theme.textColor1,
                        ),
                      ),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        // Temporary history
                        final translationHistory = state.filteredHistory[index];
                        return HistoryListTile(
                          translationHistory: translationHistory,
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
