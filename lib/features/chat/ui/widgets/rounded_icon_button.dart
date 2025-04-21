import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double borderWidth;
  final Color? borderColor;
  final VoidCallback? onTap;

  const RoundedIconButton({
    super.key,
    required this.icon,
    this.size = 35,
    this.backgroundColor = ColorsManager.backgroundDark,
    this.iconColor = Colors.white,
    this.borderWidth = 0,
    this.borderColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: borderWidth > 0
              ? Border.all(
                  color: borderColor ?? ColorsManager.lightGrey,
                  width: borderWidth,
                )
              : null,
        ),
        child: Icon(icon, color: iconColor, size: size * 0.6),
      ),
    );
  }
}
