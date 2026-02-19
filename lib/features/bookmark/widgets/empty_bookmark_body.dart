import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';

class EmptyBookmarkBody extends StatelessWidget {
  const EmptyBookmarkBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(
            Icons.bookmark_outline,
            size: 120.h,
            color: AppColors.textPlaceHolderColor,
          ),
          SizedBox(height: 16.h),
          Text('No Bookmarks', style: AppTextStyles.textSecondaryBold14),
          Text(
            'You have not bookmarked any news yet.',
            style: AppTextStyles.textSecondaryBold14,
          ),
        ],
      ),
    );
  }
}
