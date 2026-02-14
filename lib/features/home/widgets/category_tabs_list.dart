import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/widgets/category_item.dart';

class CategoryTabsList extends StatefulWidget {
  const CategoryTabsList({super.key});

  @override
  State<CategoryTabsList> createState() => _CategoryTabsListState();
}

class _CategoryTabsListState extends State<CategoryTabsList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryItem(
            isSelected: index == selectedIndex,
            title: "Category",
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
