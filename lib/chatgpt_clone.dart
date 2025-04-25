import 'package:chatgpt_clone/core/di/dependency_injection.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_models_repo.dart';
import 'package:chatgpt_clone/features/chat/logic/chat_model_provider.dart';
import 'package:chatgpt_clone/features/chat/ui/chat_screen.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatGPT extends StatelessWidget {
  const ChatGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'ChatGPT Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.scaffoldBackground,
          brightness: Brightness.dark,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ChatModelProvider(getIt.get<ChatModelsRepo>()),
            )
          ],
          child: const ChatScreen(),
        ),
      ),
    );
  }
}
