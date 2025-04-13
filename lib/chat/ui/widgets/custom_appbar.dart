import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
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
      titleSpacing: 0,
      leadingWidth: 0,
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
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ChatGPT',
              style: TextStyles.font18WhiteSemiBold,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.lightGray,
              size: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
