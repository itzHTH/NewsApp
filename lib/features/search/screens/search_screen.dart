import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/core/repos/bookmark_repo.dart';
import 'package:news/core/repos/news_repositrey.dart';
import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';
import 'package:news/features/search/cubit/search_cubit.dart';
import 'package:news/features/search/widgets/search_text_bar.dart';
import 'package:news/features/search/widgets/sreach_results_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            newsRepository: NewsRepositoryImpl(apiService: HttpApiService()),
          ),
        ),
        BlocProvider(
          create: (context) =>
              BookmarkCubit(bookmarkRepo: BookmarkRepoImpl(HiveHelper()))
                ..getBookmarks(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text("Search"),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                // Search Text Bar
                Builder(
                  builder: (context) {
                    final searchCubit = context.read<SearchCubit>();
                    return SearchTextBar(
                      onChanged: (value) {
                        searchCubit.search(query: value);
                      },
                      onFieldSubmitted: (value) {
                        searchCubit.search(query: value);
                      },
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                    );
                  },
                ),

                SizedBox(height: 12.h),

                // Search Results
                const Expanded(child: SreachResultsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
