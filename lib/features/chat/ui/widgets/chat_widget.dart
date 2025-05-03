import 'package:chatgpt_clone/features/chat/logic/chat_provider.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/text_widget.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/typing_spin_kit.dart';
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
    final chatListLenght = chatNotifier.chatMessages.length;
    final isLoading = chatNotifier.isLoading;

    return Expanded(
      child: KeyboardDismissOnTap(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: scrollController,
            itemCount: chatListLenght + 1,
            itemBuilder: (context, index) {
              if (index == chatListLenght) return isLoading ? const TypingSpinKit() : const SizedBox.shrink();
              return TextWidget(
                message: chatNotifier.chatMessages[index].message,
                chatIndex: chatNotifier.chatMessages[index].index,
              );
              
            },
          ),
        ),
      ),
    );
  }
}
