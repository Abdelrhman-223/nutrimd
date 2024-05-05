import 'package:nutrimd/home_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_tests_page.dart';

import '../../../core/widgets/logo_title.dart';
import 'on_boarding_page.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.fifthColor,
      nextScreen: const MyHomePage(),//OnBoarding(),
      splashIconSize: 175,
      splash: const LogoAndTitle(
        fieldAlignment: CrossAxisAlignment.center, logoWidth: 150,
      ),
    );
  }
}
