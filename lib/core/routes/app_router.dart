import 'package:flutter/material.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/features/Auth/screens/login_screen.dart';
import 'package:news/features/Auth/screens/register_screen.dart';
import 'package:news/features/bookmark/cubit/bookmark/bookmark_cubit.dart';
import 'package:news/features/categories/cubit/category_cubit.dart';
import 'package:news/features/categories/screens/categories_screen.dart';
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
        final args = settings.arguments;
        if (args is (NewsArticleModel, BookmarkCubit)) {
          return MaterialPageRoute(
            builder: (context) =>
                NewsDetailsScreen(article: args.$1, bookmarkCubit: args.$2),
          );
        }
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No Screen defined for ${settings.name}')),
          ),
        );
      case RoutesName.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(
            categoryCubit: settings.arguments as CategoryCubit,
          ),
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
