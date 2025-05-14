// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deepseek_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeepSeekMessage _$DeepSeekMessageFromJson(Map<String, dynamic> json) =>
    DeepSeekMessage(
      content: json['content'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$DeepSeekMessageToJson(DeepSeekMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'role': instance.role,
    };

DeepSeekSystemMessage _$DeepSeekSystemMessageFromJson(
        Map<String, dynamic> json) =>
    DeepSeekSystemMessage(
      sContent: json['content'] as String,
      sRole: json['role'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeepSeekSystemMessageToJson(
        DeepSeekSystemMessage instance) =>
    <String, dynamic>{
      'content': instance.sContent,
      'role': instance.sRole,
      'name': instance.name,
    };

DeepSeekUserMessage _$DeepSeekUserMessageFromJson(Map<String, dynamic> json) =>
    DeepSeekUserMessage(
      uContent: json['content'] as String,
      uRole: json['role'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeepSeekUserMessageToJson(
        DeepSeekUserMessage instance) =>
    <String, dynamic>{
      'content': instance.uContent,
      'role': instance.uRole,
      'name': instance.name,
    };

DeepSeekAssistantMessage _$DeepSeekAssistantMessageFromJson(
        Map<String, dynamic> json) =>
    DeepSeekAssistantMessage(
      aContent: json['content'] as String,
      aRole: json['role'] as String,
      name: json['name'] as String?,
      prefix: json['prefix'] as bool?,
      reasoningContent: json['reasoning_content'] as String?,
    );

Map<String, dynamic> _$DeepSeekAssistantMessageToJson(
        DeepSeekAssistantMessage instance) =>
    <String, dynamic>{
      'content': instance.aContent,
      'role': instance.aRole,
      'name': instance.name,
      'prefix': instance.prefix,
      'reasoning_content': instance.reasoningContent,
    };

DeepSeekChatResponseMessage _$DeepSeekChatResponseMessageFromJson(
        Map<String, dynamic> json) =>
    DeepSeekChatResponseMessage(
      content: json['content'] as String?,
      toolCalls: (json['tool_calls'] as List<dynamic>)
          .map((e) => DeepSeekToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String,
      reasoningContent: json['reasoning_content'] as String?,
    );

Map<String, dynamic> _$DeepSeekChatResponseMessageToJson(
        DeepSeekChatResponseMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'reasoning_content': instance.reasoningContent,
      'tool_calls': instance.toolCalls,
      'role': instance.role,
    };

DeepSeekToolCall _$DeepSeekToolCallFromJson(Map<String, dynamic> json) =>
    DeepSeekToolCall(
      id: json['id'] as String,
      type: json['type'] as String,
      function:
          DeepSeekFunction.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeepSeekToolCallToJson(DeepSeekToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function,
    };

DeepSeekFunction _$DeepSeekFunctionFromJson(Map<String, dynamic> json) =>
    DeepSeekFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$DeepSeekFunctionToJson(DeepSeekFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

DeepSeekLogProbs _$DeepSeekLogProbsFromJson(Map<String, dynamic> json) =>
    DeepSeekLogProbs(
      content: (json['content'] as List<dynamic>)
          .map(
              (e) => DeepSeekLogProbContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeepSeekLogProbsToJson(DeepSeekLogProbs instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

DeepSeekLogProbContent _$DeepSeekLogProbContentFromJson(
        Map<String, dynamic> json) =>
    DeepSeekLogProbContent(
      token: json['token'] as String,
      logprob: (json['logprob'] as num).toDouble(),
      bytes: (json['bytes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      topLogProbs: (json['top_logprobs'] as List<dynamic>)
          .map((e) => DeepSeekTopLogProb.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeepSeekLogProbContentToJson(
        DeepSeekLogProbContent instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
      'top_logprobs': instance.topLogProbs,
    };

DeepSeekTopLogProb _$DeepSeekTopLogProbFromJson(Map<String, dynamic> json) =>
    DeepSeekTopLogProb(
      token: json['token'] as String,
      logprob: (json['logprob'] as num).toDouble(),
      bytes: (json['bytes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$DeepSeekTopLogProbToJson(DeepSeekTopLogProb instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
    };
