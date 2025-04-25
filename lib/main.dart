import 'package:chatgpt_clone/chatgpt_clone.dart';
import 'package:chatgpt_clone/core/di/dependency_injection.dart';
import 'package:chatgpt_clone/core/helpers/brightness_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setThemingConfigurations(); 
  await dotenv.load(fileName: ".env");
  setupGetIt();
  runApp(const ChatGPT());
}
