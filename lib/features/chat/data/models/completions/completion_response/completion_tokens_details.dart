class CompletionTokensDetails {
  int? acceptedPredictionTokens;
  int? audioTokens;
  int? reasoningTokens;
  int? rejectedPredictionTokens;

  CompletionTokensDetails({
    this.acceptedPredictionTokens,
    this.audioTokens,
    this.reasoningTokens,
    this.rejectedPredictionTokens,
  });

  factory CompletionTokensDetails.fromJson(Map<String, dynamic> json) {
    return CompletionTokensDetails(
      acceptedPredictionTokens: json['accepted_prediction_tokens'] as int?,
      audioTokens: json['audio_tokens'] as int?,
      reasoningTokens: json['reasoning_tokens'] as int?,
      rejectedPredictionTokens: json['rejected_prediction_tokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'accepted_prediction_tokens': acceptedPredictionTokens,
        'audio_tokens': audioTokens,
        'reasoning_tokens': reasoningTokens,
        'rejected_prediction_tokens': rejectedPredictionTokens,
      };
}
