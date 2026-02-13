import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/widgets/trending_article_news_card.dart';

class TreendingCardsList extends StatelessWidget {
  const TreendingCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return switch (provider.requestState) {
            RequestState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
            RequestState.success => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: provider.topHeadlinesArticles.take(10).length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return TrendingArticleNewsCard(
                  articleModel: provider.topHeadlinesArticles[index],
                );
              },
            ),
            RequestState.error => const Center(
              child: Text("Error To Load Treding News"),
            ),
          };
        },
      ),
    );
  }
}
