import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';
import 'package:news/features/bookmark/widgets/bookmark_news_item.dart';

class SliverBookmarkItemList extends StatelessWidget {
  const SliverBookmarkItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<BookmarkCubit>().state as BookmarkLoaded;
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: state.articles.length,
      itemBuilder: (context, index) {
        final article = state.articles[index];
        return BookmarkNewsItem(
          article: article,
          onBookmarkTap: () {
            context.read<BookmarkCubit>().removeBookmark(article);
          },
        );
      },
    );
  }
}
