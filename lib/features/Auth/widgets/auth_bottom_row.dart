import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';

class AuthBottomRow extends StatelessWidget {
  const AuthBottomRow({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextStyles.textPrimaryRegular16),
        SizedBox(width: 8.w),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText, style: AppTextStyles.primaryRegular16),
        ),
      ],
    );
  }
}
