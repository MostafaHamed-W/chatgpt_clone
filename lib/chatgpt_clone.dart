import 'package:chatgpt_clone/chat/ui/chat_screen.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ChatGPT extends StatelessWidget {
  const ChatGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.scaffoldBackground,
        brightness: Brightness.dark,
      ),
      home: const ChatScreen(),
    );
  }
}
