import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/features/home/widgets/treending_cards_list.dart';
import 'package:news/features/home/widgets/view_all_section_widget.dart';

class TrendingHomeAppBar extends StatelessWidget {
  const TrendingHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: Stack(
        children: [
          //background image
          Image.asset(
            "assets/images/home-background.png",
            fit: BoxFit.cover,
            height: 242.h,
            width: double.infinity,
          ),
          //app bar Title
          Positioned.fill(
            top: 40.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("NEWST", style: AppTextStyles.primaryBold32),
            ),
          ),
          // Trending News View All Section
          Positioned.fill(
            top: 100.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: ViewAllSectionWidget(
                title: "Trending News",
                onPressed: () {},
              ),
            ),
          ),
          // Top News Card List
          Positioned.fill(
            top: 140.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: TreendingCardsList(),
            ),
          ),
        ],
      ),
    );
  }
}
