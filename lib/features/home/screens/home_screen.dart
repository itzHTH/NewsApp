import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/cubits/category/cubit/category_cubit.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/repos/news_repositrey.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/widgets/category_tabs_list.dart';
import 'package:news/core/widgets/sliver_category_news_list.dart';
import 'package:news/features/home/cubits/top_headline/top_headline_cubit.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/widgets/trending_home_app_bar.dart';
import 'package:news/features/home/widgets/view_all_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.isActive = false});

  final bool isActive;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // _homeProvider = HomeProvider(
    //   bookmarkRepo: BookmarkRepoImpl(HiveHelper()),
    //   newsRepository: NewsRepositoryImpl(apiService: HttpApiService()),
    // )..getCategoryArticles(catagory: ApiConfig.categoryEndpoint[0]);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {}
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopHeadlineCubit(
            newsRepository: NewsRepositoryImpl(apiService: HttpApiService()),
          )..getTopHeadlines(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            newsRepository: NewsRepositoryImpl(apiService: HttpApiService()),
          )..getCategoryArticles(),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Trending Home AppBar
            const SliverToBoxAdapter(child: TrendingHomeAppBar()),

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
            const SliverToBoxAdapter(child: CategoryTabsList()),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),
            // Category News List (For Tabs)
            const SliverCategoryNewsList(),
          ],
        ),
      ),
    );
  }
}
