import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  CustomToast._();
  static final instance = CustomToast._();

  void showDefaultToast(
    BuildContext context, {
    required String message,
  }) {
    // fToast.removeCustomToast();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: ColorsManager.lighterGrey,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
