// ignore_for_file: use_super_parameters

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qack/constants/constants.dart';
import 'package:qack/presentation/home/models/base_translation_details.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qack/presentation/home/models/deepseek_message.dart';

part 'deepseek_chat_completion.g.dart';

enum DeepSeekModel {
  /// The deepseek-chat model points to DeepSeek-V3.
  chat,

  /// The deepseek-reasoning model points to DeepSeek-R1
  reasoning,
}

enum DeepSeekResponseFormat {
  string,
  json,
}

@JsonSerializable()
final class DeepseekChatCompletion extends BaseTranslationDetails {
  DeepseekChatCompletion({
    required this.id,
    required this.object,
    required this.completionTime,
    required this.choices,
    required this.model,
    required this.systemFingerprint,
    required this.usage,
    this.prompt,
  }) : super(
          srcLanguage: 'auto',
          targetLanguage: 'auto',
          translatedText: TranslatedText(
            inputText: prompt!,
            outputText: choices[0].message.content,
          ),
        );

  factory DeepseekChatCompletion.fromJson(Map<String, dynamic> json) =>
      _$DeepseekChatCompletionFromJson(json);

  @JsonKey(includeToJson: false, includeFromJson: false)
  final String? prompt;

  @JsonKey(name: 'id', includeToJson: false)
  final String id;

  @JsonKey(name: 'object', includeToJson: false)
  final String object;

  @JsonKey(name: 'created', includeToJson: false)
  final int completionTime;

  @JsonKey(name: 'choices')
  final List<DeepSeekChoice> choices;

  @JsonKey(name: 'model', includeToJson: false)
  final String model;

  @JsonKey(name: 'system_fingerprint', includeToJson: false)
  final String systemFingerprint;

  @JsonKey(name: 'usage', includeToJson: false)
  final DeepSeekUsage usage;

  /// This should not be implemented since the toJson method is not used in the
  /// DeepSeekTranslation class.
  // Map<String, dynamic> toJson() => _$DeepSeekTranslationToJson(this);
}

@JsonSerializable()
final class DeepSeekChoice extends Equatable {
  const DeepSeekChoice({
    required this.finishReason,
    required this.index,
    required this.message,
    required this.logprobs,
  });

  factory DeepSeekChoice.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekChoiceFromJson(json);

  @JsonKey(name: 'finish_reason')
  final String finishReason;

  @JsonKey(name: 'index')
  final int index;

  @JsonKey(name: 'message')
  final DeepSeekMessage message;

  @JsonKey(name: 'logprobs')
  final DeepSeekLogProbs? logprobs;

  Map<String, dynamic> toJson() => _$DeepSeekChoiceToJson(this);

  @override
  List<Object?> get props => [finishReason, index, message, logprobs];
}

@JsonSerializable()
final class FailedDeepSeekTranslation extends BaseTranslationError
    with EquatableMixin {
  const FailedDeepSeekTranslation({
    required this.errorCode,
    required this.baiduErrorMessage,
  }) : super(errorMessage: baiduErrorMessage);

  factory FailedDeepSeekTranslation.fromJson(Map<String, dynamic> json) =>
      _$FailedDeepSeekTranslationFromJson(json);

  @JsonKey(name: 'error_code', includeToJson: false)
  final String errorCode;

  @JsonKey(name: 'error_msg', includeToJson: false)
  final String baiduErrorMessage;

  @override
  List<Object?> get props => [errorCode, baiduErrorMessage];

  @override
  String toString() =>
      'DeepSeekTranslation err code: $errorCode, err msg:$baiduErrorMessage';
}

@JsonSerializable()
final class DeepSeekUsage extends Equatable {
  const DeepSeekUsage({
    required this.completionTokens,
    required this.promptTokens,
    required this.promptCacheHitTokens,
    required this.promptCacheMissTokens,
    required this.totalTokens,
    required this.completionTokensDetails,
  });

  factory DeepSeekUsage.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekUsageFromJson(json);

  @JsonKey(name: 'completion_tokens')
  final int completionTokens;

  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;

  @JsonKey(name: 'prompt_cache_hit_tokens')
  final int promptCacheHitTokens;

  @JsonKey(name: 'prompt_cache_miss_tokens')
  final int promptCacheMissTokens;

  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  @JsonKey(name: 'completion_tokens_details')
  final DeepSeekCompletionTokensDetails completionTokensDetails;

  Map<String, dynamic> toJson() => _$DeepSeekUsageToJson(this);

  @override
  List<Object?> get props => [
        completionTokens,
        promptTokens,
        promptCacheHitTokens,
        promptCacheMissTokens,
        totalTokens,
        completionTokensDetails,
      ];
}

@JsonSerializable()
final class DeepSeekCompletionTokensDetails extends Equatable {
  const DeepSeekCompletionTokensDetails({
    required this.reasoningTokens,
  });

  factory DeepSeekCompletionTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekCompletionTokensDetailsFromJson(json);

  @JsonKey(name: 'reasoning_tokens')
  final int reasoningTokens;

  Map<String, dynamic> toJson() =>
      _$DeepSeekCompletionTokensDetailsToJson(this);

  @override
  List<Object?> get props => [reasoningTokens];
}

@JsonSerializable()
final class DeepSeekChatCompletionRequest extends Equatable {
  /// {@macro baidu_translation_request}
  const DeepSeekChatCompletionRequest({
    required this.prompt,
    required this.model,
    required this.messages,
    required this.responseFormat,
    this.stream = false,
    this.temperature = 1.3, // Recommended temperature for translation
    this.logProbability = true,
  });

  @JsonKey(name: 'messages')
  final List<DeepSeekMessage> messages;

  @_ResponseFormatSerializer()
  @JsonKey(name: 'response_format')
  final DeepSeekResponseFormat responseFormat;

  @JsonKey(name: 'q')
  final String prompt;

  @_DeepseekModelSerializer()
  @JsonKey(name: 'model')
  final DeepSeekModel model;

  @JsonKey(name: 'stream')
  final bool stream;

  final double temperature;

  @JsonKey(name: 'logprobs')
  final bool logProbability;

  Map<String, dynamic> toJson() => _$DeepSeekChatCompletionRequestToJson(this);

  @override
  List<Object?> get props => [
        prompt,
        model,
        messages,
        responseFormat,
        stream,
        temperature,
        logProbability,
      ];
}

class _ResponseFormatSerializer
    implements JsonConverter<DeepSeekResponseFormat, String> {
  const _ResponseFormatSerializer();

  /// This should not be implemented since the fromJson method is not used
  /// in [DeepSeekChatCompletionRequest].
  @override
  DeepSeekResponseFormat fromJson(String json) => throw UnimplementedError();

  @override
  String toJson(DeepSeekResponseFormat object) {
    switch (object) {
      case DeepSeekResponseFormat.string:
        return json.encode({'type': 'text'});
      case DeepSeekResponseFormat.json:
        return json.encode({'type': 'json_object'});
    }
  }
}

class _DeepseekModelSerializer implements JsonConverter<DeepSeekModel, String> {
  const _DeepseekModelSerializer();

  /// This should not be implemented since the fromJson method is not used
  /// in [DeepSeekChatCompletionRequest].
  @override
  DeepSeekModel fromJson(String json) => throw UnimplementedError();

  @override
  String toJson(DeepSeekModel object) {
    switch (object) {
      case DeepSeekModel.chat:
        return LlmModelConstants.deepseekV3;
      case DeepSeekModel.reasoning:
        return LlmModelConstants.deepseekR1;
    }
  }
}
