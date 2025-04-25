import 'package:chatgpt_clone/core/networking/api_service.dart';
import 'package:chatgpt_clone/core/networking/dio_factory.dart';
import 'package:chatgpt_clone/features/chat/data/datasources/local_chat_models_data_source.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_models_repo.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_repo.dart';
import 'package:chatgpt_clone/features/chat/logic/chat_model_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Local Chat Data Source
  getIt.registerLazySingleton<LocalChatModelsDataSource>(() => LocalChatModelsDataSource());

  // Chat Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt.get<ApiService>()));

  //Chat Model Repo
  getIt.registerLazySingleton<ChatModelsRepo>(() => ChatModelsRepo(getIt.get<ApiService>(), getIt.get<LocalChatModelsDataSource>()));

  // Chat Model Provider
  getIt.registerLazySingleton<ChatModelProvider>(() => ChatModelProvider(getIt.get<ChatModelsRepo>()));
}
