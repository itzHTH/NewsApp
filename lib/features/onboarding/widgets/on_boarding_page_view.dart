import 'package:flutter/material.dart';
import 'package:news/features/onboarding/models/page_model.dart';
import 'package:news/features/onboarding/widgets/page_widegt.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.pages,
    required this.onPageChanged,
  });

  final PageController pageController;
  final List<PageModel> pages;
  final void Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return PageWidget(page: pages[index]);
      },
      itemCount: 3,
    );
  }
}
