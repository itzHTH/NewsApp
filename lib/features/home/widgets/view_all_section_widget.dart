import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';

class ViewAllSectionWidget extends StatelessWidget {
  const ViewAllSectionWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(title, style: AppTextStyles.whiteBold16),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text("View All", style: AppTextStyles.whiteBold14Underline),
          ),
        ],
      ),
    );
  }
}
