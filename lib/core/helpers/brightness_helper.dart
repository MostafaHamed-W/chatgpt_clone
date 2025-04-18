import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/services.dart';

Future<void> setThemingConfigurations() async {
  await setCustomSystemUIOverlayStyle();
}

Future<void> setCustomSystemUIOverlayStyle() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: ColorsManager.backgroundDark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
