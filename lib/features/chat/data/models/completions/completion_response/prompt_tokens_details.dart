class PromptTokensDetails {
  int? audioTokens;
  int? cachedTokens;

  PromptTokensDetails({this.audioTokens, this.cachedTokens});

  factory PromptTokensDetails.fromJson(Map<String, dynamic> json) {
    return PromptTokensDetails(
      audioTokens: json['audio_tokens'] as int?,
      cachedTokens: json['cached_tokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'audio_tokens': audioTokens,
        'cached_tokens': cachedTokens,
      };
}
