import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;


  Future<Map<String, dynamic>> post({required String endpoint, required Object? data}) async {
    Response response = await _dio.post(
      endpoint,
      data: data,
    );
    return response.data;
  }
}
