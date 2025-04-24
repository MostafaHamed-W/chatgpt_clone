import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_repo.dart';

class ChatViewModel {
  final ChatRepo _chatRepo;
  ChatViewModel(this._chatRepo) {
    fetchChatModels();
  }

  List<ChatModel> _chatModels = [];
  List<ChatModel> get chatModels => _chatModels;

  fetchChatModels() {
    _chatModels = _chatRepo.fetchChatModels();
  }
}
