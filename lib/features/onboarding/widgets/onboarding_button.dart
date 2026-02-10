import 'package:flutter/material.dart';
import 'package:news/core/theme/app_text_styles.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.pageController,
    required this.onTap,
    required this.isLastPage,
  });

  final PageController pageController;
  final VoidCallback onTap;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        isLastPage ? "Get Started" : "Next",
        style: AppTextStyles.textButton16,
      ),
    );
  }
}
