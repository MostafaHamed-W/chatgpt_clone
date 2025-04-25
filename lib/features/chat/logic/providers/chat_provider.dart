import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_repo.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepo _chatRepo;
  ChatProvider(this._chatRepo) {
    fetchChatModels();
    _selectedModel = _chatModels.isNotEmpty ? chatModels.first : null;
  }

  List<ChatModel> _chatModels = [];
  List<ChatModel> get chatModels => _chatModels;
  ChatModel? _selectedModel;
  ChatModel? get selectedModel => _selectedModel;

  void fetchChatModels() {
    _chatModels = _chatRepo.fetchLocalChatModels();
    notifyListeners();
  }

  void selectModel(ChatModel model) {
    _selectedModel = model;
    notifyListeners();
  }
}
