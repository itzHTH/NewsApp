import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

    fontFamily: 'Times New Roman',

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        fixedSize: Size(double.maxFinite, 50),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.buttonTextColor,
      ),
    ),
  );
}
