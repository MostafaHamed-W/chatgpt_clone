import 'dart:developer';
import 'package:chatgpt_clone/core/networking/api_constants.dart';
import 'package:chatgpt_clone/core/networking/api_service.dart';

class ChatRepo {
  final ApiService _apiService;
  ChatRepo(this._apiService);

  void postCompletion() async {
    try {
      var data = await _apiService.post(
        endpoint: ApiConstants.completions,
        data: {
          "messages": [
            {"role": "system", "content": ""},
            {"role": "user", "content": "What is the capital of France?"}
          ],
          "temperature": 1,
          "top_p": 1,
          "model": "openai/gpt-4.1"
        },
      );
      log(data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
