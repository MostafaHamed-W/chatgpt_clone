import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/animated_markdown_text.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/gpt_markdown_text.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/message_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.message, required this.chatIndex, required this.shouldAnimate});
  final String? message;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    final senderChatMargin = MediaQuery.of(context).size.width * 1 / 4;
    bool isSender = chatIndex == 0;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              margin: isSender ? EdgeInsets.only(left: senderChatMargin) : EdgeInsets.zero,
              padding: isSender ? EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h) : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: isSender ? ColorsManager.backgroundCard : Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isSender && message != null) ...[
                    Text(
                      message!,
                      style: TextStyles.font14WhiteRegular,
                    ),
                  ] else ...[
                    shouldAnimate
                        ? AnimatedGptMarkdownText(
                            fullText: message!.trim(),
                            charDelay: const Duration(milliseconds: 5),
                          )
                        : GptMarkdownText(visibleText: message!
                          ),
                    if (message!.isNotEmpty) const MessageActionButtons(),
                  ] 
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
