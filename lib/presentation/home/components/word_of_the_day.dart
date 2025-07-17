import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qack/presentation/home/cubit/word_of_the_day_cubit.dart';
import 'package:qack/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class WordOfTheDayWidget extends StatelessWidget {
  const WordOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordOfTheDayCubit, WordOfTheDayState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onLongPress: () {
                if (state.wordOfTheDay?.word != null) {
                  Clipboard.setData(
                    ClipboardData(
                      text: state.wordOfTheDay!.word,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied to clipboard'),
                    ),
                  );
                }
              },
              onTap: () {
                if (state.wordOfTheDay?.word != null) {
                  launchUrl(
                    Uri(
                      scheme: 'plecoapi',
                      host: 'x-callback-url',
                      path: 's',
                      queryParameters: {
                        'q': state.wordOfTheDay!.word,
                      },
                    ),
                  );
                }
              },
              child: Text(
                state.wordOfTheDay?.word ?? 'Word of the Day',
                style: AppTextStyle.displayXS.semiBold.withChineseLetterSpacing
                    .copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            if (state.wordOfTheDay != null)
              Text(
                state.wordOfTheDay!.pinyin,
                style: AppTextStyle.displayXS.medium.copyWith(
                  color: Colors.white,
                ),
              ),
            if (state.wordOfTheDay?.definitions != null)
              Text(
                state.wordOfTheDay!.definitions!.first,
                style: AppTextStyle.displayXS.medium.copyWith(
                  color: Colors.white,
                ),
              ),
            if (state.wordOfTheDay?.exampleSentences != null)
              Text(
                state.wordOfTheDay!.exampleSentences!.first.sentence,
                style: AppTextStyle.textMD.semiBold.withChineseLetterSpacing
                    .copyWith(
                  color: Colors.white,
                ),
              ),
          ],
        );
      },
    );
  }
}
