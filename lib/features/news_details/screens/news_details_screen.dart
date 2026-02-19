import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/extensions/datetime_format_extenstion.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/bookmark_repo.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/author_and_time_news_card.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';
import 'package:news/features/home/providers/home_provider.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({super.key, required this.article, this.homeProvider});

  final NewsArticleModel article;
  final HomeProvider? homeProvider;
  final IBookmarkRepo _bookmarkRepo = BookmarkRepoImpl(HiveHelper());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text("News Details"),
              centerTitle: true,
              pinned: true,
              backgroundColor: AppColors.bgColor,
              surfaceTintColor: Colors.transparent,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CustomCachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 228.h,
                  width: 343.w,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: Text(
                article.title ?? "No title available",
                style: AppTextStyles.textPrimaryBold20,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: AuthorAndTimeNewsCard(
                authorName: article.author ?? "Unknown",
                time: article.publishedAt?.calculateTimeAgo ?? "Now",
                image: article.urlToImage ?? "",
                isDark: true,
                hasBookmark: true,
                isBookmarked: homeProvider?.isBookmarked(article) ?? false,
                onBookmarkTap: () {
                  if (homeProvider != null) {
                    homeProvider!.toggleBookmark(article);
                  } else {
                    _bookmarkRepo.saveBookmark(article);
                  }
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: Text(
                article.content ?? "No description available",
                style: AppTextStyles.textSecondaryRegular16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
