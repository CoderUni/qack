import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/history/bloc/history_bloc.dart';
import 'package:qack/presentation/history/repositories/history_repository.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/utils/database/database.dart';
import 'package:qack/widgets/input/input.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        HistoryRepository(appDatabase: context.read<AppDatabase>()),
      ),
      child: const LayoutHandler(
        mobile: HistoryView(),
        tablet: HistoryView(),
      ),
    );
  }
}

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    context.read<HistoryBloc>().add(const HistoryFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: AppSearchBar(),
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
                        } else if (state.history.isEmpty) {
                          // TODO: only show this text if history and filter
                          // are empty
                          return const Center(
                            child: Text('No history available'),
                          );
                        }

                        // Temporary history
                        final translationHistory = state.history[index];
                        return ListTile(
                          title: Text(translationHistory.input),
                          subtitle: Text(
                            translationHistory.items
                                    ?.map((item) => item.output)
                                    .join('\n') ??
                                '',
                          ),
                        );
                      },
                      childCount: state.history.length,
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
