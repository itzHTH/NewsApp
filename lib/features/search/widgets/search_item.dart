import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/models/news_article_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.article, required this.onTap});

  final NewsArticleModel article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      title: Text(article.title ?? "No Title"),
      leading: Icon(
        Icons.search_rounded,
        size: 28.h,
        color: AppColors.textPlaceHolderColor,
      ),
    );
  }
}
