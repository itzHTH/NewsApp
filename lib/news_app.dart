import 'package:flutter/material.dart';
import 'package:news/core/routes/app_router.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/features/spalsh/splash_screen.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SplashScreen()),
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RoutesName.onboradingScreen,
    );
  }
}
