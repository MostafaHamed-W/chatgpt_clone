import 'package:chatgpt_clone/features/chat/data/models/chat_message.dart/chat_message.dart';
import 'package:chatgpt_clone/features/chat/data/models/completions/completion_response/completion_response.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension CompletionResponseMapper on CompletionResponse {
  List<ChatMessage> toChatMessages() {
    return choices
            ?.map(
              (choice) => ChatMessage(
                message: choice.message?.content ?? '',
                index: 1,
              ),
            )
            .toList() ??
        [];
  }
}
