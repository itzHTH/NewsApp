import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/widgets/category_news_card.dart';
import 'package:news/features/home/widgets/category_news_card_shimmer.dart';

class SliverCategoryNewsList extends StatelessWidget {
  const SliverCategoryNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return switch (provider.categoryRequestState) {
          RequestState.loading => SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                return const CategoryNewsCardShimmer();
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: 10,
            ),
          ),
          RequestState.error => SliverToBoxAdapter(
            child: Text(provider.errorMessage),
          ),

          RequestState.success => SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: provider.categoryArticles.length,
              itemBuilder: (context, index) {
                final article = provider.categoryArticles[index];
                return CategoryNewsCard(
                  articleModel: article,
                  isBookmarked: provider.isBookmarked(article),
                  onBookmarkTap: () {
                    provider.toggleBookmark(article);
                  },
                );
              },
            ),
          ),
        };
      },
    );
  }
}
