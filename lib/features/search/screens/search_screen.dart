import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/features/search/widgets/sreach_results_list.dart';
import 'package:provider/provider.dart';
import 'package:news/core/repos/news_repositrey.dart';
import 'package:news/features/search/provider/search_provider.dart';
import 'package:news/features/search/widgets/search_text_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(
        newsRepository: NewsRepositoryImpl(apiService: HttpApiService()),
      )..search(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text("Search"),
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
                    final searchProvider = context.read<SearchProvider>();
                    return SearchTextBar(
                      onChanged: (value) {
                        searchProvider.search(query: value);
                      },
                      onFieldSubmitted: (value) {
                        searchProvider.search(query: value);
                      },
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                    );
                  },
                ),

                SizedBox(height: 12.h),

                // Search Results
                Expanded(child: SreachResultsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
