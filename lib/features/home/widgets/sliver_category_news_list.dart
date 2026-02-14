import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/widgets/category_news_card.dart';
import 'package:provider/provider.dart';

class SliverCategoryNewsList extends StatelessWidget {
  const SliverCategoryNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: provider.categoryArticles.length,
            itemBuilder: (context, index) {
              return CategoryNewsCard(
                articleModel: provider.categoryArticles[index],
              );
            },
          ),
        );
      },
    );
  }
}
