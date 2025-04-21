import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageActionButtons extends StatelessWidget {
  const MessageActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          _MessageIconButton(icon: Icons.copy_all_rounded, onTap: () {}),
          _MessageIconButton(icon: Icons.volume_up, onTap: () {}),
          _MessageIconButton(icon: Icons.thumb_up, onTap: () {}),
          _MessageIconButton(icon: Icons.thumb_down, onTap: () {}),
          _MessageIconButton(icon: Icons.cached, onTap: () {}),
        ],
      ),
    );
  }
}

class _MessageIconButton extends StatelessWidget {
  const _MessageIconButton({
    this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Icon(
          icon,
          size: 18.w,
          color: ColorsManager.lighterGrey,
        ),
      ),
    );
  }
}
