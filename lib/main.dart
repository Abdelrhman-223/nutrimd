import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'on_boarding/presentation/pages/splash_screen.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  sharedPreferences.setBool("logging", false);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NutriMD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.mainColor,
          onPrimary: AppColors.fifthColor,
          secondary: AppColors.secondColor,
          onSecondary: AppColors.fifthColor,
          error: AppColors.redColor,
          onError: AppColors.fifthColor,
          background: AppColors.fifthColor,
          onBackground: AppColors.mainColor,
          surface: AppColors.fifthColor,
          onSurface: AppColors.mainColor,
        ),
        fontFamily: AppFonts.appFontFamily,
      ),
      home: const SplashScreen(),
      //  home page will view the diet protocol.
    );
  }
}
