import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/widgets/category_news_card_shimmer.dart';
import 'package:provider/provider.dart';

import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/widgets/category_news_card.dart';

class SliverCategoryNewsList extends StatelessWidget {
  const SliverCategoryNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeProvider, RequestState>(
      selector: (context, provider) => provider.categoryRequestState,
      builder: (context, requestState, child) {
        return switch (requestState) {
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
            child: Text(context.read<HomeProvider>().errorMessage),
          ),

          RequestState.success => SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: context.read<HomeProvider>().categoryArticles.length,
              itemBuilder: (context, index) {
                return CategoryNewsCard(
                  articleModel: context
                      .read<HomeProvider>()
                      .categoryArticles[index],
                );
              },
            ),
          ),
        };
      },
    );
  }
}
