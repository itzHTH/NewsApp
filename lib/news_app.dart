import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/routes/app_router.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/features/spalsh/splash_screen.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 832),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SplashScreen()),
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RoutesName.onboradingScreen,
      ),
    );
  }
}
