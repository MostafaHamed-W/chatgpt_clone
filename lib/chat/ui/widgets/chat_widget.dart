import 'package:chatgpt_clone/chat/data/constants.dart';
import 'package:chatgpt_clone/chat/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: KeyboardDismissOnTap(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: scrollController,
            itemCount: chatMessages.length,
            itemBuilder: (context, index) {
              return TextWidget(
                message: chatMessages[index]['msg'].toString(),
                chatIndex: int.parse(chatMessages[index]['chatIndex'].toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}
