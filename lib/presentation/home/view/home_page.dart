import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qack/presentation/home/bloc/home_bloc.dart';
import 'package:qack/widgets/input/input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Gap(24),
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
                      if (text.trim().isNotEmpty) {
                        context
                            .read<HomeBloc>()
                            .add(HomeTextChanged(sourceText: text));
                      }
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return switch (state) {
                        HomeInitial() => const Text(
                            'Please enter text to translate',
                          ),
                        HomeTextStateEmpty() => const Text(
                            'Please enter text to translate',
                          ),
                        HomeTextTranslateLoading() => Text(
                            'Translating...',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        HomeTextTranslateSuccess() => Text(
                            state.translationDetails.entries.first.value
                                .translatedText.outputText,
                          ),
                        HomeTextTranslateError() => const Text('Error'),
                      };
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
