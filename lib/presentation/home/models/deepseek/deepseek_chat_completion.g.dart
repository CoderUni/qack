// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deepseek_chat_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeepseekChatCompletion _$DeepseekChatCompletionFromJson(
        Map<String, dynamic> json) =>
    DeepseekChatCompletion(
      id: json['id'] as String,
      object: json['object'] as String,
      completionTime: (json['created'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => DeepSeekChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      systemFingerprint: json['system_fingerprint'] as String,
      usage: DeepSeekUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeepseekChatCompletionToJson(
        DeepseekChatCompletion instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };

DeepSeekChoice _$DeepSeekChoiceFromJson(Map<String, dynamic> json) =>
    DeepSeekChoice(
      finishReason: json['finish_reason'] as String,
      index: (json['index'] as num).toInt(),
      message: DeepSeekChatResponseMessage.fromJson(
          json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'] == null
          ? null
          : DeepSeekLogProbs.fromJson(json['logprobs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeepSeekChoiceToJson(DeepSeekChoice instance) =>
    <String, dynamic>{
      'finish_reason': instance.finishReason,
      'index': instance.index,
      'message': instance.message,
      'logprobs': instance.logprobs,
    };

FailedDeepSeekTranslation _$FailedDeepSeekTranslationFromJson(
        Map<String, dynamic> json) =>
    FailedDeepSeekTranslation(
      errorCode: json['error_code'] as String,
      baiduErrorMessage: json['error_msg'] as String,
    );

Map<String, dynamic> _$FailedDeepSeekTranslationToJson(
        FailedDeepSeekTranslation instance) =>
    <String, dynamic>{};

DeepSeekUsage _$DeepSeekUsageFromJson(Map<String, dynamic> json) =>
    DeepSeekUsage(
      completionTokens: (json['completion_tokens'] as num).toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      promptCacheHitTokens: (json['prompt_cache_hit_tokens'] as num).toInt(),
      promptCacheMissTokens: (json['prompt_cache_miss_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
      completionTokensDetails: json['completion_tokens_details'] == null
          ? null
          : DeepSeekCompletionTokensDetails.fromJson(
              json['completion_tokens_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeepSeekUsageToJson(DeepSeekUsage instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'prompt_cache_hit_tokens': instance.promptCacheHitTokens,
      'prompt_cache_miss_tokens': instance.promptCacheMissTokens,
      'total_tokens': instance.totalTokens,
      if (instance.completionTokensDetails case final value?)
        'completion_tokens_details': value,
    };

DeepSeekCompletionTokensDetails _$DeepSeekCompletionTokensDetailsFromJson(
        Map<String, dynamic> json) =>
    DeepSeekCompletionTokensDetails(
      reasoningTokens: (json['reasoning_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$DeepSeekCompletionTokensDetailsToJson(
        DeepSeekCompletionTokensDetails instance) =>
    <String, dynamic>{
      'reasoning_tokens': instance.reasoningTokens,
    };

DeepSeekChatCompletionRequest _$DeepSeekChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    DeepSeekChatCompletionRequest(
      prompt: json['q'] as String,
      model: const _DeepseekModelSerializer().fromJson(json['model'] as String),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => DeepSeekMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseFormat: const _ResponseFormatSerializer()
          .fromJson(json['response_format'] as Map<String, dynamic>),
      stream: json['stream'] as bool? ?? false,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.3,
      logProbability: json['logprobs'] as bool? ?? true,
    );

Map<String, dynamic> _$DeepSeekChatCompletionRequestToJson(
        DeepSeekChatCompletionRequest instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'response_format':
          const _ResponseFormatSerializer().toJson(instance.responseFormat),
      'q': instance.prompt,
      'model': const _DeepseekModelSerializer().toJson(instance.model),
      'stream': instance.stream,
      'temperature': instance.temperature,
      'logprobs': instance.logProbability,
    };
