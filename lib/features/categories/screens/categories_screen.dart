import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/widgets/category_tabs_list.dart';
import 'package:news/core/widgets/sliver_category_news_list.dart';
import 'package:news/features/categories/cubit/category_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categoryCubit});

  final CategoryCubit categoryCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: categoryCubit,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              title: Text('Categories'),
              centerTitle: true,
              backgroundColor: AppColors.bgColor,
              surfaceTintColor: Colors.transparent,
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
