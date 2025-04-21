import 'dart:developer';
import 'package:chatgpt_clone/core/error/failure.dart';
import 'package:chatgpt_clone/core/networking/api_service.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/data/models/completions/completion_response/completion_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  final ApiService _apiService;
  ChatRepo(this._apiService);

  Future<Either<Failure, CompletionResponse>> postCompletion({required ChatModel chatModel}) async {
    try {
      var data = await _apiService.post(
        endpoint: chatModel.endpoint,
        data: {
          "messages": [
            {"role": "system", "content": ""},
            {"role": "user", "content": "What is the capital of France?"}
          ],
          "temperature": 1,
          "top_p": 1,
          "model": chatModel.id
        },
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
