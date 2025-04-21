import 'content_filter_results.dart';

class PromptFilterResult {
  int? promptIndex;
  ContentFilterResults? contentFilterResults;

  PromptFilterResult({this.promptIndex, this.contentFilterResults});

  factory PromptFilterResult.fromJson(Map<String, dynamic> json) {
    return PromptFilterResult(
      promptIndex: json['prompt_index'] as int?,
      contentFilterResults: json['content_filter_results'] == null
          ? null
          : ContentFilterResults.fromJson(
              json['content_filter_results'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'prompt_index': promptIndex,
        'content_filter_results': contentFilterResults?.toJson(),
      };
}
