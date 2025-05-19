import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/layout/layout_handler.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/presentation/home/components/components.dart';
import 'package:qack/presentation/home/models/baidu_translation.dart';
import 'package:qack/presentation/home/models/models.dart';
import 'package:qack/widgets/input/input.dart';

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
    this.topContentPadding = 24,
    super.key,
  });

  final EdgeInsets contentPadding;
  final double topContentPadding;

  final double inputTextBottomPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: contentPadding,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Gap(topContentPadding),
                  const AppSearchBar(),
                  InputText(
                    maxLength: 6000,
                    minLines: 5,
                    maxLines: 5,
                    labelText: '',
                    hintText: 'What do you want to say?',
                    // TODO: Validate length based on enabled translators
                    // 6000 characters for baidu
                    validator: (_) => null,
                    onChanged: (text) {
                      context
                          .read<HomeBloc>()
                          .add(HomeTextChanged(sourceText: text));
                    },
                  ),
                  Gap(inputTextBottomPadding),
                ]),
              ),
            ),
            SliverPadding(
              padding: contentPadding,
              sliver: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final translationList =
                      state.translationDetails.values.toList();

                  return switch (state) {
                    HomeInitial() => const SliverToBoxAdapter(
                        child: Text(
                          'Please enter text to translate',
                        ),
                      ),
                    HomeTextStateEmpty() => const SliverToBoxAdapter(
                        child: Text(
                          'Please enter text to translate',
                        ),
                      ),
                    HomeTextTranslateLoading() => SliverToBoxAdapter(
                        child: Text(
                          'Translating...',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    HomeTextTranslateSuccess() => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return TranslationCard(
                              translationDetails: translationList[index],
                            );
                          },
                          childCount: state.translationDetails.length,
                        ),
                      ),
                    HomeTextTranslateError() => const Text('Error'),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
