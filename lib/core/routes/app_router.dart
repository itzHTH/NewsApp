import 'package:flutter/material.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/features/Auth/screens/login_screen.dart';
import 'package:news/features/Auth/screens/register_screen.dart';
import 'package:news/features/categories/screens/categories_screen.dart';
import 'package:news/features/home/providers/home_provider.dart';
import 'package:news/features/main/screens/main_screen.dart';
import 'package:news/features/news_details/screens/news_details_screen.dart';
import 'package:news/features/onboarding/screens/onborading_screen.dart';
import 'package:news/features/spalsh/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.onboradingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboradingScreen(),
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RoutesName.newsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => NewsDetailsScreen(
            article: settings.arguments as NewsArticleModel,
          ),
        );
      case RoutesName.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) =>
              CategoriesScreen(provider: settings.arguments as HomeProvider),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No Screen defined for ${settings.name}')),
          ),
        );
    }
  }
}
