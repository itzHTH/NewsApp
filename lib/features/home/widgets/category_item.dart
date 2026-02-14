import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : null,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          title,
          style: AppTextStyles.textSecondaryRegular16?.copyWith(
            color: isSelected ? AppColors.textPrimaryWhiteColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
