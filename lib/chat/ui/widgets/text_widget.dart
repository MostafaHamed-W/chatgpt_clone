import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.message, required this.chatIndex});
  final String message;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    bool isSender = chatIndex == 0;
    return Row(
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
                Text(
                  message,
                  style: TextStyles.font14WhiteRegular,
                ),
                isSender
                    ? const SizedBox.shrink()
                    : Padding(
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
                      )
              ],
            ),
          ),
        ),
      ],
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
