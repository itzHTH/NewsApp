import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
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
                ? AppTextStyles.whiteBold20
                : AppTextStyles.textPrimaryBold20,
          ),
          Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(12.r),
              splashColor: AppColors.textTertiaryColor.withValues(alpha: 0.2),
              highlightColor: AppColors.textTertiaryColor.withValues(
                alpha: 0.2,
              ),
              overlayColor: WidgetStateProperty.all(
                AppColors.textTertiaryColor.withValues(alpha: 0.2),
              ),
              splashFactory: InkRipple.splashFactory,

              child: Text(
                "View All",
                style: !isDark
                    ? AppTextStyles.whiteBold14Underline
                    : AppTextStyles.textPrimaryRegular14Underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
