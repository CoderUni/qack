import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/constants/padding.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/dictionary/bloc/dictionary_bloc.dart';
import 'package:qack/presentation/dictionary/components/components.dart';
import 'package:qack/theme/theme.dart';
import 'package:qack/utils/database/database.dart';
import 'package:qack/widgets/input/input.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHandler(
      mobile: DictionaryView(
        searchBarPadding: EdgeInsets.only(
          top: 16,
          left: PaddingConstants.mobileHorizontalMarginValue,
          right: PaddingConstants.mobileHorizontalMarginValue,
        ),
        searchBarMargin: EdgeInsets.only(bottom: 16),
      ),
      tablet: DictionaryView(
        searchBarPadding: EdgeInsets.only(
          top: 24,
          left: PaddingConstants.tabletHorizontalMarginValue,
          right: PaddingConstants.tabletHorizontalMarginValue,
        ),
        searchBarMargin: EdgeInsets.only(bottom: 16),
      ),
    );
  }
}

class DictionaryView extends StatefulWidget {
  const DictionaryView({
    required this.searchBarPadding,
    required this.searchBarMargin,
    super.key,
  });
  final EdgeInsets searchBarPadding;
  final EdgeInsets searchBarMargin;

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    return Scaffold(
      body: Scrollbar(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: widget.searchBarPadding,
                sliver: SliverToBoxAdapter(
                  child: AppSearchBar(
                    margin: widget.searchBarMargin,
                    onChanged: (query) {
                      if (query.isNotEmpty) {
                        context
                            .read<DictionaryBloc>()
                            .add(DictionaryQueried(query));
                      } else {
                        context.read<DictionaryBloc>().add(DictionaryFetched());
                      }
                    },
                    hintText: 'Search',
                  ),
                ),
              ),
              BlocBuilder<DictionaryBloc, DictionaryState>(
                buildWhen: (previous, current) =>
                    current.status != DictionaryStatus.loading,
                builder: (context, state) {
                  if (state.status == DictionaryStatus.failure) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Failed to load history',
                          style: AppTextStyle.displayXS.medium.copyWith(
                            color: theme.errorColor,
                          ),
                        ),
                      ),
                    );
                  } else if (state.dictionaryEntries.isEmpty) {
                    // If no entries are available during first launch,
                    // fetch them
                    context.read<DictionaryBloc>().add(DictionaryFetched());
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No words available.',
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
                        return DictionaryListTile(
                          entry: state.dictionaryEntries.elementAt(index),
                        );
                      },
                      childCount: state.dictionaryEntries.length,
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
