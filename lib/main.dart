import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';
import 'on_boarding/presentation/pages/splash_screen.dart';

void main() {
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
        fontFamily: AppFonts.appFontFamily,
      ),
      home: const SplashScreen(),
    //  home page will view the diet protocol.
    );
  }
}