import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:news/core/constant/app_constants.dart';
import 'package:news/core/data/local/shared_helper.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/features/onboarding/models/page_model.dart';
import 'package:news/features/onboarding/widgets/on_boarding_page_view.dart';
import 'package:news/features/onboarding/widgets/onboarding_button.dart';

class OnboradingScreen extends StatefulWidget {
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

class _OnboradingScreenState extends State<OnboradingScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<PageModel> pages = [
    PageModel(
      title: 'Trending News',
      description:
          'Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now!',
      image: 'assets/images/onboarding-phone1.png',
    ),
    PageModel(
      title: 'Pick What You Love',
      description:
          'No more endless scrolling! Tap into your favorite topics like Tech, Politics, or Sports and get personalized news in seconds',
      image: 'assets/images/onboarding-phone2.png',
    ),
    PageModel(
      title: 'Save It. Read It Later. Stay Smart.',
      description:
          'Found something interesting? Tap the bookmark and come back to it anytime. Never l       ose a great read again!',
      image: 'assets/images/onboarding-phone3.png',
    ),
  ];

  bool _isLastPage = false;

  void skip() {
    pageController.animateToPage(
      pages.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void next() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void finish() async {
    await SharedPrefsHelper().setBoolValue(AppConstants.isFirstTime, false);
    if (!mounted) return;
    context.pushNamedAndRemoveUntil(RoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        actions: [
          _isLastPage
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: skip,
                  child: Text("Skip", style: AppTextStyles.primaryRegular16),
                ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                child: OnBoardingPageView(
                  pageController: pageController,
                  pages: pages,
                  onPageChanged: (index) {
                    setState(() {
                      _isLastPage = index == pages.length - 1;
                    });
                  },
                ),
              ),
              SizedBox(height: 20.h),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: SwapEffect(activeDotColor: AppColors.primaryColor),
              ),
              SizedBox(height: 120.h),
              OnboardingButton(
                pageController: pageController,
                onTap: _isLastPage ? finish : next,
                isLastPage: _isLastPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
