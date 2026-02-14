import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';

class ViewAllSectionWidget extends StatelessWidget {
  const ViewAllSectionWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDark = false,
  });

  final String title;
  final bool isDark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            title,
            style: !isDark
                ? AppTextStyles.whiteBold16
                : AppTextStyles.textPrimaryBold16,
          ),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "View All",
              style: !isDark
                  ? AppTextStyles.whiteBold14Underline
                  : AppTextStyles.textPrimaryRegular14Underline,
            ),
          ),
        ],
      ),
    );
  }
}
