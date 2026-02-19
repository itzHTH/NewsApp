import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/bookmark/widgets/bookmark_news_item.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          const SliverAppBar(
            title: Text('Bookmark'),
            pinned: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.bgColor,
            surfaceTintColor: Colors.transparent,
          ),
          // Body
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: BookmarkNewsItem(
                article: NewsArticleModel(
                  author: "",
                  title: "",
                  description: "",
                  urlToImage: "",
                  publishedAt: DateTime.now(),
                  content: "",
                  url: "",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
