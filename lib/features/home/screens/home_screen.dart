import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/features/home/widgets/treending_cards_list.dart';
import 'package:provider/provider.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/repos/home_repositrey.dart';
import 'package:news/features/home/widgets/view_all_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(
        homeRepository: HomeRepositoryImpl(apiService: HttpApiService()),
      )..getTopHeadlines(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300.h,
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
                        child: Text(
                          "NEWST",
                          style: AppTextStyles.primaryBold32,
                        ),
                      ),
                    ),
                    // Catigories View All Section
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
