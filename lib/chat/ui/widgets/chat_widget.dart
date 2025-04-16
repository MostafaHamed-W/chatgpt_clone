import 'package:chatgpt_clone/chat/data/constants.dart';
import 'package:chatgpt_clone/chat/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
      child: ListView.builder(
        itemCount: chatMessages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: TextWidget(
              message: chatMessages[index]['msg'].toString(),
              chatIndex: int.parse(chatMessages[index]['chatIndex'].toString()),
            ),
          );
        },
      ),
    );
  }
}
