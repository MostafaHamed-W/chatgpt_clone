import 'package:chatgpt_clone/core/di/dependency_injection.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:chatgpt_clone/features/chat/logic/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatModelSelector extends StatefulWidget {
  const ChatModelSelector({super.key, required this.onChanged});
  final void Function(ChatModel) onChanged;

  @override
  State<ChatModelSelector> createState() => _ChatModelSelectorState();
}

class _ChatModelSelectorState extends State<ChatModelSelector> {
  late ChatModel selectedModel;
  late List<ChatModel> chatModels;

  @override
  void initState() {
    chatModels = getIt.get<ChatViewModel>().chatModels;
    selectedModel = chatModels[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<ChatModel>(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        style: TextStyles.font16WhiteSemiBold,
        dropdownColor: ColorsManager.backgroundDark,
        menuMaxHeight: 250.h,
        borderRadius: BorderRadius.circular(10.r),
        icon: Icon(Icons.arrow_forward_ios, color: ColorsManager.lightGrey, size: 16.h),
        value: selectedModel,
        items: chatModels.map(
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
            setState(() {
              selectedModel = newValue;
            });
            widget.onChanged(newValue);
          }
        },
      ),
    );
  }
}
