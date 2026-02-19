import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constant/app_constants.dart';
import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/data/local/shared_helper.dart';
import 'package:news/features/bookmark/data/models/bookmark_model.dart';
import 'package:news/news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper().initHive();
  HiveHelper().registerAdapter(BookmarkModelAdapter());
  await HiveHelper().openLazyBox<BookmarkModel>(
    AppConstants.bookmarkNewsLazyBox,
  );

  await SharedPrefsHelper().initShared();
  await ScreenUtil.ensureScreenSize();

  runApp(const NewsApp());
}
