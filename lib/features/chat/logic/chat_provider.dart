import 'dart:developer';

import 'package:chatgpt_clone/features/chat/data/models/chat_message.dart/chat_message.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_repo.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepo _chatRepo;
  ChatProvider(this._chatRepo);

  final List<ChatMessage> _chatMessages = [];
  List<ChatMessage> get chatMessages => _chatMessages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void addUserMessage({required String userMessage}) async {
    _chatMessages.add(ChatMessage(message: userMessage, index: 0));
    notifyListeners();
  }

  Future<void> sendMessage({
    required ChatModel chatModel,
    required String chatMessage,
  }) async {
    _isLoading = true;
    notifyListeners();
    final result = await _chatRepo.sendMessage(
      chatModel: chatModel,
      chatMessage: chatMessage,
    );
    
    // Simulate backend loading time on testing 
    // await Future.delayed(const Duration(seconds: 3));
    
    result.fold(
      (failure) {
        log(failure.errMessage);
        _isLoading = false;
        notifyListeners();
      },
      (chatMessages) {
        _chatMessages.addAll(chatMessages);
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
