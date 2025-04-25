import 'package:chatgpt_clone/core/networking/api_service.dart';
import 'package:chatgpt_clone/features/chat/data/datasources/local_chat_models_data_source.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';

class ChatModelsRepo {
  // We may be want to load chat models from api later
  // ignore: unused_field
  final ApiService _apiService;
  final LocalChatModelsDataSource _localChatModelsDataSource;
  ChatModelsRepo(this._apiService, this._localChatModelsDataSource);

  List<ChatModel> fetchLocalChatModels() {
    try {
      var chatModels = _localChatModelsDataSource.fetchLocalDataModels();
      return chatModels;
    } catch (e) {
      throw Exception('Error loading models, Please try again later');
    }
  }
}
