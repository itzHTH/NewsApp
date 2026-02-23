import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/repos/bookmark_repo.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';
import 'package:news/features/bookmark/widgets/empty_bookmark_body.dart';
import 'package:news/features/bookmark/widgets/sliver_bookmark_item_list.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key, this.isActive = false});

  final bool isActive;

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookmarkCubit(bookmarkRepo: BookmarkRepoImpl(HiveHelper()))
            ..getBookmarks(),
      child: Scaffold(
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
              sliver: BlocBuilder<BookmarkCubit, BookmarkState>(
                builder: (context, state) {
                  switch (state) {
                    case BookmarkLoading():
                      return const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    case BookmarkError():
                      return SliverFillRemaining(
                        child: Center(child: Text(state.message)),
                      );
                    case BookmarkLoaded():
                      return state.bookmarkArticles.isEmpty
                          ? const SliverFillRemaining(
                              child: EmptyBookmarkBody(),
                            )
                          : SliverBookmarkItemList(
                              bookmarkArtical: state.bookmarkArticles,
                            );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
