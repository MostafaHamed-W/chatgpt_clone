import 'choice.dart';
import 'prompt_filter_result.dart';
import 'usage.dart';

class CompletionResponse {
  List<Choice>? choices;
  int? created;
  String? id;
  String? model;
  String? object;
  List<PromptFilterResult>? promptFilterResults;
  String? systemFingerprint;
  Usage? usage;

  CompletionResponse({
    this.choices,
    this.created,
    this.id,
    this.model,
    this.object,
    this.promptFilterResults,
    this.systemFingerprint,
    this.usage,
  });

  factory CompletionResponse.fromJson(Map<String, dynamic> json) {
    return CompletionResponse(
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      id: json['id'] as String?,
      model: json['model'] as String?,
      object: json['object'] as String?,
      promptFilterResults: (json['prompt_filter_results'] as List<dynamic>?)
          ?.map((e) => PromptFilterResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      systemFingerprint: json['system_fingerprint'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'choices': choices?.map((e) => e.toJson()).toList(),
        'created': created,
        'id': id,
        'model': model,
        'object': object,
        'prompt_filter_results':
            promptFilterResults?.map((e) => e.toJson()).toList(),
        'system_fingerprint': systemFingerprint,
        'usage': usage?.toJson(),
      };
}
