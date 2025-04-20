import 'package:chatgpt_clone/core/helpers/spacing.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedTextIconButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final double size;
  final Color iconColor;
  final double borderWidth;
  final Color? borderColor;
  final String text;
  final bool initiallySelected;
  final void Function(bool isSelected)? onTap;

  const RoundedTextIconButton({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor = ColorsManager.backgroundDark,
    this.iconColor = Colors.white,
    this.size = 35,
    this.borderWidth = 0,
    this.borderColor,
    this.onTap,
    this.initiallySelected = false,
  });

  @override
  State<RoundedTextIconButton> createState() => _RoundedTextIconButtonState();
}

class _RoundedTextIconButtonState extends State<RoundedTextIconButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initiallySelected;
  }

  void _toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onTap?.call(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: widget.size.h,
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.selectionBackground : ColorsManager.backgroundDark,
          borderRadius: BorderRadius.circular(18.r),
          border: widget.borderWidth > 0
              ? Border.all(
                  color: isSelected ? ColorsManager.selectionBorder : ColorsManager.lightGrey,
                  width: widget.borderWidth,
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: isSelected ? ColorsManager.lightBlue : widget.iconColor,
                size: widget.size * 0.6,
              ),
              horizentalWidth(5),
              Text(
                widget.text,
                style: isSelected ? TextStyles.font12LightBlueRegular : TextStyles.font12WhiteRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
