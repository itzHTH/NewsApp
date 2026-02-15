import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/remote/api_config.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/core/repos/news_repositrey.dart';
import 'package:news/core/widgets/category_tabs_list.dart';
import 'package:news/core/widgets/sliver_category_news_list.dart';
import 'package:news/features/home/widgets/trending_home_app_bar.dart';
import 'package:news/features/home/widgets/view_all_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeProvider(
              newsRepository: NewsRepositoryImpl(apiService: HttpApiService()),
            )
            ..getTopHeadlines()
            ..getCategoryArticles(catagory: ApiConfig.categoryEndpoint[0]),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Trending Home AppBar
            SliverToBoxAdapter(child: TrendingHomeAppBar()),

            // Category Section
            SliverToBoxAdapter(
              child: Builder(
                builder: (context) {
                  return ViewAllSectionWidget(
                    title: "Category",
                    onPressed: () {
                      context.pushNamed(
                        RoutesName.categoriesScreen,
                        arguments: context.read<HomeProvider>(),
                      );
                    },
                    isDark: true,
                  );
                },
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
