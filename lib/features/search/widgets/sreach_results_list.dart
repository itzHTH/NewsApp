import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/features/search/provider/search_provider.dart';
import 'package:news/features/search/widgets/search_item.dart';
import 'package:provider/provider.dart';

class SreachResultsList extends StatelessWidget {
  const SreachResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) {
        switch (provider.searchState) {
          case RequestState.loading:
            return Center(child: CircularProgressIndicator());

          case RequestState.error:
            return Center(child: Text("Error"));

          case RequestState.success:
            return ListView.separated(
              itemCount: provider.searchResults.length,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Divider(height: 1.h),
                );
              },
              itemBuilder: (context, index) {
                return SearchItem(
                  article: provider.searchResults[index],
                  onTap: () {},
                );
              },
            );
        }
      },
    );
  }
}
