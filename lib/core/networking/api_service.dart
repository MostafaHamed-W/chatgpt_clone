import 'package:chatgpt_clone/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;
  final _baseUrl = ApiConstants.apiBaseUrl;

  Future<Map<String, dynamic>> post({required String endpoint, required Object? data}) async {
    Response response = await _dio.post(
      '$_baseUrl$endpoint',
      data: data,
    );
    return response.data;
  }
}
