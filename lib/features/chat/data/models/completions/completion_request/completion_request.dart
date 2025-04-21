import 'message.dart';

class CompletionRequest {
  List<Message>? messages;
  String? model;
  int? temperature;
  int? maxTokens;
  int? topP;

  CompletionRequest({
    this.messages,
    this.model,
    this.temperature,
    this.maxTokens,
    this.topP,
  });

  factory CompletionRequest.fromJson(Map<String, dynamic> json) {
    return CompletionRequest(
      messages: (json['messages'] as List<dynamic>?)?.map((e) => Message.fromJson(e as Map<String, dynamic>)).toList(),
      model: json['model'] as String?,
      temperature: json['temperature'] as int?,
      maxTokens: json['max_tokens'] as int?,
      topP: json['top_p'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'messages': messages?.map((e) => e.toJson()).toList(),
        'model': model,
        'temperature': temperature,
        'max_tokens': maxTokens,
        'top_p': topP,
      };
}
