import 'package:chatgpt_clone/chat/data/constants.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatModelSelector extends StatefulWidget {
  const ChatModelSelector({super.key, required this.onChanged, required this.initialValue});
  final void Function(String) onChanged;
  final String initialValue;

  @override
  State<ChatModelSelector> createState() => _ChatModelSelectorState();
}

class _ChatModelSelectorState extends State<ChatModelSelector> {
  late String selectedModel;

  @override
  void initState() {
    selectedModel = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        style: TextStyles.font16WhiteSemiBold,
        dropdownColor: ColorsManager.backgroundDark,
        menuMaxHeight: 250.h,
        borderRadius: BorderRadius.circular(10.r),
        icon: Icon(Icons.arrow_forward_ios, color: ColorsManager.lightGrey, size: 16.h),
        value: selectedModel,
        items: chatModels.map(
          (model) {
            return DropdownMenuItem<String>(
              value: model,
              child: Text(
                model,
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
