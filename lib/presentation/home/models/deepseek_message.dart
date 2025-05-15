import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deepseek_message.g.dart';

@JsonSerializable()
final class DeepSeekMessage extends Equatable {
  const DeepSeekMessage({
    required this.content,
    required this.role,
  });

  factory DeepSeekMessage.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekMessageFromJson(json);

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'role')
  final String role;

  Map<String, dynamic> toJson() => _$DeepSeekMessageToJson(this);

  @override
  List<Object?> get props => [content, role];
}

@JsonSerializable()
final class DeepSeekSystemMessage extends DeepSeekMessage {
  const DeepSeekSystemMessage({
    required this.sContent,
    this.sRole = 'system',
    this.name,
  }) : super(
          content: sContent,
          role: sRole,
        );

  factory DeepSeekSystemMessage.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekSystemMessageFromJson(json);

  @JsonKey(name: 'content')
  final String sContent;

  @JsonKey(name: 'role')
  final String sRole;

  @JsonKey(name: 'name')
  final String? name;

  @override
  Map<String, dynamic> toJson() => _$DeepSeekSystemMessageToJson(this);

  @override
  List<Object?> get props => [sContent, sRole, name];
}

@JsonSerializable()
final class DeepSeekUserMessage extends DeepSeekMessage {
  const DeepSeekUserMessage({
    required this.uContent,
    this.name,
    this.uRole = 'user',
  }) : super(
          content: uContent,
          role: uRole,
        );

  factory DeepSeekUserMessage.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekUserMessageFromJson(json);

  @JsonKey(name: 'content')
  final String uContent;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'role')
  final String uRole;

  @override
  Map<String, dynamic> toJson() => _$DeepSeekUserMessageToJson(this);

  @override
  List<Object?> get props => [uContent, uRole, name];
}

@JsonSerializable()
final class DeepSeekAssistantMessage extends DeepSeekMessage {
  const DeepSeekAssistantMessage({
    required this.aContent,
    this.aRole = 'assistant',
    this.name,
    this.prefix,
    this.reasoningContent,
  }) : super(
          content: aContent,
          role: aRole,
        );

  factory DeepSeekAssistantMessage.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekAssistantMessageFromJson(json);

  @JsonKey(name: 'content')
  final String aContent;

  @JsonKey(name: 'role')
  final String aRole;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'prefix')
  final bool? prefix;

  @JsonKey(name: 'reasoning_content')
  final String? reasoningContent;

  @override
  Map<String, dynamic> toJson() => _$DeepSeekAssistantMessageToJson(this);

  @override
  List<Object?> get props => [content, aRole, name, prefix, reasoningContent];
}

/// [DeepSeekChatResponseMessage] is a class that represents a message in a chat
/// response. It contains the content of the message, the reasoning content,
/// the tool calls made, and the role of the message sender.
@JsonSerializable()
final class DeepSeekChatResponseMessage extends Equatable {
  const DeepSeekChatResponseMessage({
    required this.content,
    required this.toolCalls,
    required this.role,
    this.reasoningContent,
  });

  factory DeepSeekChatResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekChatResponseMessageFromJson(json);

  @JsonKey(name: 'content')
  final String? content;

  @JsonKey(name: 'reasoning_content')
  final String? reasoningContent;

  @JsonKey(name: 'tool_calls',includeIfNull: false)
  final List<DeepSeekToolCall>? toolCalls;

  @JsonKey(name: 'role')
  final String role;

  Map<String, dynamic> toJson() => _$DeepSeekChatResponseMessageToJson(this);

  @override
  List<Object?> get props => [content, reasoningContent, toolCalls, role];
}

@JsonSerializable()
final class DeepSeekToolCall extends Equatable {
  const DeepSeekToolCall({
    required this.id,
    required this.type,
    required this.function,
  });

  factory DeepSeekToolCall.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekToolCallFromJson(json);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'function')
  final DeepSeekFunction function;

  Map<String, dynamic> toJson() => _$DeepSeekToolCallToJson(this);

  @override
  List<Object?> get props => [id, type, function];
}

@JsonSerializable()
final class DeepSeekFunction extends Equatable {
  const DeepSeekFunction({
    required this.name,
    required this.arguments,
  });

  factory DeepSeekFunction.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekFunctionFromJson(json);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'arguments')
  final String arguments;

  Map<String, dynamic> toJson() => _$DeepSeekFunctionToJson(this);

  @override
  List<Object?> get props => [name, arguments];
}

@JsonSerializable()
final class DeepSeekLogProbs extends Equatable {
  const DeepSeekLogProbs({
    required this.content,
  });

  factory DeepSeekLogProbs.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekLogProbsFromJson(json);

  @JsonKey(name: 'content')
  final List<DeepSeekLogProbContent> content;

  Map<String, dynamic> toJson() => _$DeepSeekLogProbsToJson(this);

  @override
  List<Object?> get props => [content];
}

@JsonSerializable()
final class DeepSeekLogProbContent extends Equatable {
  const DeepSeekLogProbContent({
    required this.token,
    required this.logprob,
    required this.bytes,
    required this.topLogProbs,
  });

  factory DeepSeekLogProbContent.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekLogProbContentFromJson(json);

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'logprob')
  final double logprob;

  @JsonKey(name: 'bytes')
  final List<int> bytes;

  @JsonKey(name: 'top_logprobs')
  final List<DeepSeekTopLogProb> topLogProbs;

  Map<String, dynamic> toJson() => _$DeepSeekLogProbContentToJson(this);

  @override
  List<Object?> get props => [token, logprob, bytes, topLogProbs];
}

@JsonSerializable()
final class DeepSeekTopLogProb extends Equatable {
  const DeepSeekTopLogProb({
    required this.token,
    required this.logprob,
    required this.bytes,
  });

  factory DeepSeekTopLogProb.fromJson(Map<String, dynamic> json) =>
      _$DeepSeekTopLogProbFromJson(json);

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'logprob')
  final double logprob;

  @JsonKey(name: 'bytes')
  final List<int> bytes;

  Map<String, dynamic> toJson() => _$DeepSeekTopLogProbToJson(this);

  @override
  List<Object?> get props => [token, logprob, bytes];
}
