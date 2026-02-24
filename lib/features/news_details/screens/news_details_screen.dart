import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/datetime_format_extenstion.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/author_and_time_news_card.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';
import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    super.key,
    required this.article,
    required this.bookmarkCubit,
  });

  final NewsArticleModel article;
  final BookmarkCubit bookmarkCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bookmarkCubit,
      child: Scaffold(
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
                child: Builder(
                  builder: (context) {
                    return AuthorAndTimeNewsCard(
                      authorName: article.author ?? "Unknown",
                      time: article.publishedAt?.calculateTimeAgo ?? "Now",
                      image: article.urlToImage ?? "",
                      isDark: true,
                      hasBookmark: true,
                      isBookmarked: context.read<BookmarkCubit>().isBookmarked(
                        article,
                      ),
                      onBookmarkTap: () {
                        context.read<BookmarkCubit>().toggleBookmark(article);
                      },
                    );
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
      ),
    );
  }
}
