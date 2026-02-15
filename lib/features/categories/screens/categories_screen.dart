import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/widgets/category_tabs_list.dart';
import 'package:news/core/widgets/sliver_category_news_list.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.provider});

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text('Categories'),
              centerTitle: true,
              backgroundColor: AppColors.bgColor,
              surfaceTintColor: Colors.transparent,
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
