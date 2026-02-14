import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({
    super.key,
    required this.onChanged,
    required this.onFieldSubmitted,
    required this.onTapOutside,
  });

  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final Function(PointerDownEvent) onTapOutside;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      cursorColor: AppColors.textTertiaryColor,
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        fillColor: AppColors.bgColor,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 28.h),
        ),
        suffixIconColor: AppColors.textTertiaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.border2Color),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.border2Color),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.border2Color),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
