import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font18WhiteSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font20WhiteSemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font18LighterGreyRegular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lighterGrey,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font16LighterGreyRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lighterGrey,
  );

  static TextStyle font16WhiteRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font14WhiteRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle font12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font12LightBlueRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightBlue,
  );
}
