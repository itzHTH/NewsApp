import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/datetime_format_extenstion.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/author_and_time_news_card.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';

class BookmarkNewsItem extends StatelessWidget {
  const BookmarkNewsItem({super.key, required this.article});

  final NewsArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        CustomCachedNetworkImage(
          imageUrl: article.urlToImage ?? "",
          height: 200.h,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        SizedBox(height: 6.h),

        // Title
        Text(
          article.title ?? "",
          style: AppTextStyles.textPrimaryBold16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 2.h),

        // Description
        AuthorAndTimeNewsCard(
          authorName: article.author ?? "Unknown",
          time: article.publishedAt?.calculateTimeAgo ?? "Just Now",
          image: article.urlToImage ?? "",
          isDark: true,
          hasBookmark: true,
        ),
      ],
    );
  }
}
