abstract class LLMPromptConstants {
  const LLMPromptConstants();

  static const String wordOfTheDayPrompt =
      'Use millisecond timestamp as nonce. Return raw '
      'JSON:{"word":...,"pinyin":...,"definitions":[...],'
      '"exampleSentences":[{"sentence":...,"pinyin":...,'
      '"translation":...}]}'
      'Pick a new advanced but common Chinese word each run';
}
