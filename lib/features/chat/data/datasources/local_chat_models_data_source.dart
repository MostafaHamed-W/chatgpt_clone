import 'package:chatgpt_clone/core/networking/api_paths.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';

class LocalChatModelsDataSource {
  List<ChatModel> fetchLocalDataModels() => const [
        ChatModel(
          id: 'openai/gpt-4.1',
          name: 'ChatGPT-4.1',
          endpoint: ApiConstants.githubModels,
        ),
        ChatModel(
          id: 'deepseek/DeepSeek-V3-0324',
          name: 'DeepSeek-V3',
          endpoint: ApiConstants.githubModels,
        ),
        ChatModel(
          id: 'gpt-4o',
          name: 'ChatGPT-4o',
          endpoint: ApiConstants.azureModels,
        ),
        ChatModel(
          id: 'gpt-4o-mini',
          name: 'ChatGPT-4o-Mini',
          endpoint: ApiConstants.azureModels,
        ),
        ChatModel(
          id: 'openai/gpt-4.1-mini',
          name: 'ChatGPT-4.1-Mini',
          endpoint: ApiConstants.githubModels,
        ),
        ChatModel(
          id: 'openai/gpt-4.1-nano',
          name: 'ChatGPT-4.1-Nano',
          endpoint: ApiConstants.githubModels,
        ),
      ];
}
