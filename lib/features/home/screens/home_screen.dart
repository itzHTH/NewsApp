import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:news/core/data/remote/api_service.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/repos/home_repositrey.dart';
import 'package:news/features/home/widgets/category_tabs_list.dart';
import 'package:news/features/home/widgets/sliver_category_news_list.dart';
import 'package:news/features/home/widgets/trending_home_app_bar.dart';
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
            // Trending Home AppBar
            SliverToBoxAdapter(child: TrendingHomeAppBar()),

            // Category Section
            SliverToBoxAdapter(
              child: ViewAllSectionWidget(
                title: "Category",
                onPressed: () {},
                isDark: true,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),
            // Category Tabs List
            SliverToBoxAdapter(child: CategoryTabsList()),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),
            // Category News List (For Tabs)
            SliverCategoryNewsList(),
          ],
        ),
      ),
    );
  }
}
