import 'dart:developer';
import 'package:chatgpt_clone/core/error/failure.dart';
import 'package:chatgpt_clone/core/networking/api_service.dart';
import 'package:chatgpt_clone/features/chat/data/datasources/local_chat_models_data_source.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/data/models/completions/completion_request/completion_request.dart';
import 'package:chatgpt_clone/features/chat/data/models/completions/completion_request/message.dart';
import 'package:chatgpt_clone/features/chat/data/models/completions/completion_response/completion_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  final ApiService _apiService;
  final LocalChatModelsDataSource _localChatModelsDataSource;
  ChatRepo(this._apiService, this._localChatModelsDataSource);

  List<ChatModel> fetchLocalChatModels() {
    try {
      var chatModels = _localChatModelsDataSource.fetchLocalDataModels();
      return chatModels;
    } catch (e) {
      throw Exception('Error loading models, Please try again later');
    }
  }

  Future<Either<Failure, CompletionResponse>> postCompletion({required ChatModel chatModel}) async {
    try {
      log(chatModel.id);
      var data = await _apiService.post(
        endpoint: chatModel.endpoint,
        data: CompletionRequest(
          messages: [
            Message(role: 'system', content: ''),
            Message(role: 'user', content: 'What is the capital of France?'),
          ],
          model: chatModel.id,
          temperature: 1,
          topP: 1,
        ),
      );
      return Right(CompletionResponse.fromJson(data));
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
