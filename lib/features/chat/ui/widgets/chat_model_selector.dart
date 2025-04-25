import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:chatgpt_clone/features/chat/logic/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatModelSelector extends StatelessWidget {
  const ChatModelSelector({super.key});


  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatModelProvider>();
    return DropdownButtonHideUnderline(
      child: DropdownButton<ChatModel?>(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        style: TextStyles.font16WhiteSemiBold,
        dropdownColor: ColorsManager.backgroundDark,
        menuMaxHeight: 250.h,
        borderRadius: BorderRadius.circular(10.r),
        icon: Icon(Icons.arrow_forward_ios, color: ColorsManager.lightGrey, size: 16.h),
        value: chatProvider.selectedModel,
        items: chatProvider.chatModels.map(
          (model) {
            return DropdownMenuItem<ChatModel>(
              value: model,
              child: Text(
                model.name,
                style: TextStyles.font16WhiteSemiBold,
              ),
            );
          },
        ).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            chatProvider.selectModel(newValue);
          }
        },
      ),
    );
  }
}
