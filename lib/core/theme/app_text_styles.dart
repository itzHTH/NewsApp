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

  static TextStyle? primaryBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle? primaryBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle? whiteBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryWhiteColor,
  );

  static TextStyle? whiteBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryWhiteColor,
  );

  static TextStyle? whiteRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryWhiteColor,
  );

  static TextStyle? whiteBold14Underline = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryWhiteColor,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textPrimaryWhiteColor,
    decorationThickness: 2.sp,
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

  static TextStyle? textSecondaryBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondaryColor,
  );
  static TextStyle? textSecondaryBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle? textSecondaryRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle? textPrimaryRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle? textPrimaryRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle? textPrimaryBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle? textPrimaryRegular14Underline = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textPrimaryColor,
    decorationThickness: 2.sp,
  );

  static TextStyle? textTertiaryRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiaryColor,
  );
}
