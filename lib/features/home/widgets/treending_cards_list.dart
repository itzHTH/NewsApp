import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/widgets/trending_article_news_card_shimmer.dart';
import 'package:provider/provider.dart';

import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/home/widgets/trending_article_news_card.dart';

class TreendingCardsList extends StatelessWidget {
  const TreendingCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Selector<HomeProvider, RequestState>(
        selector: (context, provider) => provider.topHeadlineRequestState,
        builder: (context, requestState, child) {
          return switch (requestState) {
            // loading
            RequestState.loading => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return const TrendingArticleNewsCardShimmer();
              },
            ),
            // success
            RequestState.success => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: context
                  .read<HomeProvider>()
                  .topHeadlinesArticles
                  .take(10)
                  .length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return TrendingArticleNewsCard(
                  articleModel: context
                      .read<HomeProvider>()
                      .topHeadlinesArticles[index],
                );
              },
            ),
            // error
            RequestState.error => Center(
              child: Text(
                "Error To Load Treding News",
                style: AppTextStyles.primaryRegular16,
              ),
            ),
          };
        },
      ),
    );
  }
}
