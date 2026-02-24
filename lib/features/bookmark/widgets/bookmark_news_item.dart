import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/datetime_format_extenstion.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/author_and_time_news_card.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';
import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';

class BookmarkNewsItem extends StatelessWidget {
  const BookmarkNewsItem({
    super.key,
    required this.article,
    required this.onBookmarkTap,
    required this.isBookmarked,
  });

  final NewsArticleModel article;
  final VoidCallback onBookmarkTap;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          RoutesName.newsDetailsScreen,
          arguments: (article, context.read<BookmarkCubit>()),
        );
      },
      child: Column(
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
            isBookmarked: isBookmarked,
            onBookmarkTap: () => onBookmarkTap(),
          ),
        ],
      ),
    );
  }
}
