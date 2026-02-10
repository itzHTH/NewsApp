import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/features/onboarding/models/page_model.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({super.key, required this.page});
  final PageModel page;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(page.image),
        SizedBox(height: 20.h),
        Text(page.title, style: AppTextStyles.prDarkGrayBold20),
        SizedBox(height: 20.h),
        Text(
          page.description,
          style: AppTextStyles.prMediumGray16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
