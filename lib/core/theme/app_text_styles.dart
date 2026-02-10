import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle? textButton16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonTextColor,
  );

  static TextStyle? primaryRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  static TextStyle? prDarkGrayBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.prDarkGray,
  );

  static TextStyle? prMediumGray16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.prMediumGray,
  );
}
