import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/local/shared_helper.dart';
import 'package:news/news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper().initShared();
  await ScreenUtil.ensureScreenSize();
  runApp(const NewsApp());
}
