import 'dart:developer';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/chat_model_selector.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.sort,
          size: 26.r,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit_outlined,
            size: 23.r,
          ),
        )
      ],
      backgroundColor: ColorsManager.scaffoldBackground,
      title: ChatModelSelector(
        onChanged: (model) {
          log('Selcetd model: ${model.id}');
        },
        initialValue: chatModels[0],
      ),
    );
  }
}
