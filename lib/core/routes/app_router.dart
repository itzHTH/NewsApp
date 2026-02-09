import 'package:flutter/material.dart';
import 'package:news/core/routes/routes_name.dart';
import 'package:news/features/spalsh/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No Screen defined for ${settings.name}')),
          ),
        );
    }
  }
}
