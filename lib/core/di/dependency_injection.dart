import 'package:chatgpt_clone/core/networking/api_service.dart';
import 'package:chatgpt_clone/core/networking/dio_factory.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Chat Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt.get<ApiService>()));
}
