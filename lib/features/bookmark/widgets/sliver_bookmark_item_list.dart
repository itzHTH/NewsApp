import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';
import 'package:news/features/bookmark/widgets/bookmark_news_item.dart';

class SliverBookmarkItemList extends StatelessWidget {
  const SliverBookmarkItemList({super.key, required this.state});

  final BookmarkLoaded state;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: state.articles.length,
      itemBuilder: (context, index) {
        final article = state.articles[index];
        return BookmarkNewsItem(
          key: ValueKey(article.url ?? index.toString()),
          article: article,
          isBookmarked: context.read<BookmarkCubit>().isBookmarked(article),
          onBookmarkTap: () {
            context.read<BookmarkCubit>().toggleBookmark(article);
          },
        );
      },
    );
  }
}
