import 'package:chatgpt_clone/features/chat/logic/chat_provider.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final chatNotifier = context.watch<ChatProvider>();
    return Expanded(
      child: KeyboardDismissOnTap(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: scrollController,
            itemCount: chatNotifier.chatMessages.length,
            itemBuilder: (context, index) {
              bool isLastItem = index == chatNotifier.chatMessages.length - 1;
              return TextWidget(
                message: chatNotifier.chatMessages[index].message,
                chatIndex: chatNotifier.chatMessages[index].index,
                isLastItem: isLastItem,
              );
            },
          ),
        ),
      ),
    );
  }
}
