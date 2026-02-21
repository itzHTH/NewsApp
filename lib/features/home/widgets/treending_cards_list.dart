import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/features/home/cubits/top_headline/top_headline_cubit.dart';
import 'package:news/features/home/widgets/trending_article_news_card.dart';
import 'package:news/features/home/widgets/trending_article_news_card_shimmer.dart';

class TreendingCardsList extends StatelessWidget {
  const TreendingCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: BlocBuilder<TopHeadlineCubit, TopHeadlineState>(
        builder: (context, state) {
          return switch (state) {
            // loading
            TopHeadlineLoading _ => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return const TrendingArticleNewsCardShimmer();
              },
            ),
            // success
            TopHeadlineLoaded state => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: state.topHeadlinesArticles.take(10).length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return TrendingArticleNewsCard(
                  articleModel: state.topHeadlinesArticles[index],
                );
              },
            ),
            // error
            TopHeadlineError state => Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.primaryRegular16,
              ),
            ),
          };
        },
      ),
    );
  }
}
