import 'completion_tokens_details.dart';
import 'prompt_tokens_details.dart';

class Usage {
  int? completionTokens;
  CompletionTokensDetails? completionTokensDetails;
  int? promptTokens;
  PromptTokensDetails? promptTokensDetails;
  int? totalTokens;

  Usage({
    this.completionTokens,
    this.completionTokensDetails,
    this.promptTokens,
    this.promptTokensDetails,
    this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        completionTokens: json['completion_tokens'] as int?,
        completionTokensDetails: json['completion_tokens_details'] == null
            ? null
            : CompletionTokensDetails.fromJson(
                json['completion_tokens_details'] as Map<String, dynamic>),
        promptTokens: json['prompt_tokens'] as int?,
        promptTokensDetails: json['prompt_tokens_details'] == null
            ? null
            : PromptTokensDetails.fromJson(
                json['prompt_tokens_details'] as Map<String, dynamic>),
        totalTokens: json['total_tokens'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'completion_tokens': completionTokens,
        'completion_tokens_details': completionTokensDetails?.toJson(),
        'prompt_tokens': promptTokens,
        'prompt_tokens_details': promptTokensDetails?.toJson(),
        'total_tokens': totalTokens,
      };
}
