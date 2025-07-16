import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:http_client/http_client.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/presentation/home/models/models.dart';
import 'package:qack/presentation/settings/models/translator_details.dart';

final class WordOfTheDayRepository {
  const WordOfTheDayRepository();

  Future<WordOfTheDay> fetchWordOfTheDay(String deepSeekApiKey) async {
    final httpClient = GetIt.I<Http>();
    final rootIsolateToken = RootIsolateToken.instance;

    return _askDeepseek(
      httpClient: httpClient,
      rootIsolateToken: rootIsolateToken!,
      secretKey: deepSeekApiKey,
    );
  }

  Future<WordOfTheDay> _askDeepseek({
    required Http httpClient,
    required RootIsolateToken rootIsolateToken,
    required String secretKey,
  }) async {
    // Initialize platform channel plugins (like http) in the isolate
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    const deepseekCompletionRequest = DeepSeekChatCompletionRequest(
      prompt: '',
      model: DeepSeekModel.chat,
      messages: [
        DeepSeekUserMessage(
          // TODO: Feed with stuff from user's translation or dictionary
          // history
          uContent: LLMPromptConstants.wordOfTheDayPrompt,
        ),
      ],
      responseFormat: DeepSeekResponseFormat.string,
    );

    final response = await httpClient.post(
      LinkConstants.deepSeekChatCompletionUrl,
      deepseekCompletionRequest.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $secretKey',
      },
    );

    final message = _cleanDeepseekJsonResponse(
      DeepseekChatCompletion.fromJson(
        response.data as Map<String, dynamic>,
      ).choices.first.message.content!,
    );

    print('Received message: $message');

    return WordOfTheDay.fromJson(
      jsonDecode(message) as Map<String, dynamic>,
    );
  }

  String _cleanDeepseekJsonResponse(String input) {
    // Non-greedy search for the first fenced JSON block (or just fences)
    final match =
        RegExp(r'[\s\S]*?```(?:json)?\s*([\s\S]*?)\s*```').firstMatch(input);
    String candidate;

    if (match != null) {
      // Use the content inside the first fence
      candidate = match.group(1)!;
    } else {
      // Fallback: no fences found, just trim whitespace
      candidate = input.trim();
    }

    return candidate;
  }
}
