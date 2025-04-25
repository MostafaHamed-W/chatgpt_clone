import 'package:chatgpt_clone/core/networking/api_paths.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String id;
  final String name;
  final String endpoint;

  const ChatModel({
    this.endpoint = ApiConstants.githubModels,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        endpoint,
        id,
        name,
      ];
}
