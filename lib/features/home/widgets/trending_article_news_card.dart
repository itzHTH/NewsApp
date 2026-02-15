import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news/core/extensions/datetime_format_extenstion.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/author_and_time_news_card.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';

class TrendingArticleNewsCard extends StatelessWidget {
  const TrendingArticleNewsCard({super.key, required this.articleModel});

  final NewsArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // News Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CustomCachedNetworkImage(
            height: 140.h,
            width: 235.w,
            imageUrl: articleModel.urlToImage ?? "",
            fit: BoxFit.cover,
          ),
        ),

        // gradient overlay
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
        ),

        // news title and author and time
        Positioned.fill(
          top: 60.h,
          left: 16.w,
          right: 16.w,
          child: Column(
            children: [
              // news title
              Text(
                articleModel.title ?? "No Title",
                style: AppTextStyles.whiteBold14,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              // author and time
              AuthorAndTimeNewsCard(
                authorName: articleModel.author ?? "Unknown",
                time:
                    articleModel.publishedAt?.calculateTimeAgo ??
                    "Unknown Time",
                image: articleModel.urlToImage ?? "",
              ),
            ],
          ),
        ),

        // Click effect
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              splashColor: AppColors.primaryColor.withValues(alpha: 0.1),
              highlightColor: AppColors.primaryColor.withValues(alpha: 0.1),
              overlayColor: WidgetStatePropertyAll(
                AppColors.primaryColor.withValues(alpha: 0.1),
              ),
              splashFactory: InkSplash.splashFactory,
              onTap: () {
                context.pushNamed(
                  RoutesName.newsDetailsScreen,
                  arguments: articleModel,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
