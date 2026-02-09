import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bgColor,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'TimesNewRoman',
  );
}
