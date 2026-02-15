import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/datetime_format_extenstion.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/widgets/author_and_time_news_card.dart';

class CategoryNewsCard extends StatelessWidget {
  const CategoryNewsCard({super.key, required this.articleModel});

  final NewsArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4.r),

      onTap: () {
        context.pushNamed(
          RoutesName.newsDetailsScreen,
          arguments: articleModel,
        );
      },
      child: Row(
        children: [
          // Image Container
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: CustomCachedNetworkImage(
              imageUrl: articleModel.urlToImage ?? "",
              height: 68.h,
              width: 122.h,
            ),
          ),
          SizedBox(width: 8.w),
          // Text Container
          Expanded(
            child: Column(
              children: [
                Text(
                  articleModel.title ?? "",
                  style: AppTextStyles.textPrimaryBold16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                AuthorAndTimeNewsCard(
                  isDark: true,
                  authorName: articleModel.author ?? "Unknown",
                  time:
                      articleModel.publishedAt?.calculateTimeAgo ?? "Just Now",
                  image: articleModel.urlToImage ?? "",
                  hasBookmark: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
