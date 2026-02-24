import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';
import 'package:news/features/search/cubit/search_cubit.dart';
import 'package:news/features/search/widgets/search_item.dart';

class SreachResultsList extends StatelessWidget {
  const SreachResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return switch (state) {
          SearchLoading() => const Center(child: CircularProgressIndicator()),
          SearchError() => const Center(child: Text("Error")),
          SearchLoaded(:final searchResults) => ListView.separated(
            itemCount: searchResults.length,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Divider(height: 1.h),
              );
            },
            itemBuilder: (context, index) {
              return SearchItem(
                article: searchResults[index],
                onTap: () {
                  context.pushNamed(
                    RoutesName.newsDetailsScreen,
                    arguments: (
                      searchResults[index],
                      context.read<BookmarkCubit>(),
                    ),
                  );
                },
              );
            },
          ),
        };
      },
    );
  }
}
