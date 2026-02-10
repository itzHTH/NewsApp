import 'package:flutter/material.dart';
import 'package:news/core/constant/app_constants.dart';
import 'package:news/core/data/local/shared_helper.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      final isFirstTime = SharedPrefsHelper().getBoolValue(
        AppConstants.isFirstTime,
      );
      if (!mounted) return;
      if (isFirstTime == null || isFirstTime) {
        context.pushNamedAndRemoveUntil(RoutesName.onboradingScreen);
      } else {
        context.pushNamedAndRemoveUntil(RoutesName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash-screen.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
