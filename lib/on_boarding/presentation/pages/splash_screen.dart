import 'package:nutrimd/authentication_pages/presentation/pages/auth_page.dart';
import 'package:nutrimd/home_page/presentation/pages/home_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_tests_page.dart';

import '../../../core/widgets/logo_title.dart';
import '../../../main.dart';
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

  Widget afterOnBoardingScreen = const MyHomePage();
  @override
  void initState() {
    if(sharedPreferences.containsKey("finishOnBoarding")) {
      if (sharedPreferences.getBool("finishOnBoarding")!) {
        if (sharedPreferences.getBool("logging")!) {
          if (sharedPreferences.getBool("finishEnterMedicalData")!) {
            afterOnBoardingScreen = const MyHomePage();
          } else {
            afterOnBoardingScreen = const MedicalTestsPage();
          }
        } else {
          afterOnBoardingScreen = const AuthPage();
        }
      } else {
        afterOnBoardingScreen = const OnBoarding();
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.fifthColor,
      // nextScreen: const MyHomePage(),
      nextScreen: afterOnBoardingScreen,
      splashIconSize: 175,
      splash: const LogoAndTitle(
        fieldAlignment: CrossAxisAlignment.center,
        logoWidth: 150,
      ),
    );
  }
}
