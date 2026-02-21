import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/cubits/category/cubit/category_cubit.dart';
import 'package:news/features/home/widgets/category_news_card.dart';
import 'package:news/features/home/widgets/category_news_card_shimmer.dart';

class SliverCategoryNewsList extends StatelessWidget {
  const SliverCategoryNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return switch (state) {
          CategoryLoading() => SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                return const CategoryNewsCardShimmer();
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: 10,
            ),
          ),

          CategoryLoaded state => SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: state.categoryArticles.length,
              itemBuilder: (context, index) {
                final article = state.categoryArticles[index];
                return CategoryNewsCard(
                  articleModel: article,
                  isBookmarked: false,
                  onBookmarkTap: () {},
                );
              },
            ),
          ),

          CategoryError state => SliverToBoxAdapter(child: Text(state.message)),
        };
      },
    );
  }
}
