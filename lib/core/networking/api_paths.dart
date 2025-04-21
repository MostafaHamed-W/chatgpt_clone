class ApiConstants {
  // BaseUrls
  static const String githubAiBaseUrl = "https://models.github.ai";
  static const String azureBaseUrl = 'https://models.inference.ai.azure.com';

  // Interface
  static const String inference = '/inference';

  // Chat
  static const String chat = '/chat';

  // Completions
  static const completions = "$chat/completions";

  // Endpoints
  static const String githubModels = '$githubAiBaseUrl$inference$completions';
  static const String azureModels = '$azureBaseUrl$completions';
}
