import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            title: Text('Bookmark'),
            pinned: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.bgColor,
            surfaceTintColor: Colors.transparent,
          ),
          // Body
          SliverToBoxAdapter(child: Center(child: Text('Bookmark'))),
        ],
      ),
    );
  }
}
