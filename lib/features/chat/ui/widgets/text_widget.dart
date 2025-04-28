import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:chatgpt_clone/features/chat/logic/chat_provider.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/message_action_buttons.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/typing_spin_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.message, required this.chatIndex, required this.isLastItem});
  final String? message;
  final int chatIndex;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    final chatNotifier = context.watch<ChatProvider>();
    bool isSender = chatIndex == 0;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
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
                    DefaultTextStyle(
                      style: TextStyles.font14WhiteRegular,
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText(message!, cursor: ''),
                        ],
                      ),
                    ),
                    if (message!.isNotEmpty) const MessageActionButtons(),
                  ],
                  if (chatNotifier.isLoading) const TypingSpinKit()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
