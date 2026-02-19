import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/bookmark/widgets/sliver_bookmark_item_list.dart';
import 'package:provider/provider.dart';
import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/bookmark/provider/bookmark_provider.dart';
import 'package:news/core/repos/bookmark_repo.dart';
import 'package:news/features/bookmark/widgets/empty_bookmark_body.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          BookmarkProvider(BookmarkRepoImpl(HiveHelper()))..getBookmarks(),
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
              sliver: Consumer<BookmarkProvider>(
                builder: (context, provider, child) =>
                    provider.bookmarks.isEmpty
                    ? const SliverFillRemaining(child: EmptyBookmarkBody())
                    : const SliverBookmarkItemList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
