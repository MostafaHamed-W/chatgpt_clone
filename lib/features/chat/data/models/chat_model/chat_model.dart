import 'package:chatgpt_clone/core/networking/api_paths.dart';

class ChatModel {
  final String id;
  final String name;
  final String endpoint;

  ChatModel({
    this.endpoint = ApiConstants.githubModels,
    required this.id,
    required this.name,
  });
}


