import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/bookmark/provider/bookmark_provider.dart';
import 'package:news/features/bookmark/widgets/bookmark_news_item.dart';
import 'package:provider/provider.dart';

class SliverBookmarkItemList extends StatelessWidget {
  const SliverBookmarkItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: context.watch<BookmarkProvider>().bookmarks.length,
      itemBuilder: (context, index) => BookmarkNewsItem(
        article: context.watch<BookmarkProvider>().bookmarks[index],
      ),
    );
  }
}
