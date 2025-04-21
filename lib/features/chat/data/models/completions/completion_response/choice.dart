import 'content_filter_results.dart';
import 'message.dart';

class Choice {
  ContentFilterResults? contentFilterResults;
  String? finishReason;
  int? index;
  dynamic logprobs;
  Message? message;

  Choice({
    this.contentFilterResults,
    this.finishReason,
    this.index,
    this.logprobs,
    this.message,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        contentFilterResults: json['content_filter_results'] == null ? null : ContentFilterResults.fromJson(json['content_filter_results'] as Map<String, dynamic>),
        finishReason: json['finish_reason'] as String?,
        index: json['index'] as int?,
        logprobs: json['logprobs'] as dynamic,
        message: json['message'] == null ? null : Message.fromJson(json['message'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'content_filter_results': contentFilterResults?.toJson(),
        'finish_reason': finishReason,
        'index': index,
        'logprobs': logprobs,
        'message': message?.toJson(),
      };
}
