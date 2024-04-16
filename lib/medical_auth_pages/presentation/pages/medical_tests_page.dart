/*
**********Project Name: nutrimd
**********File Name: medical_tests_page
**********Created At: 15-Apr-24 3:15 PM
**********Author: Abdelrhman Hussein
**********Description: This page to show the medical tests that we need from the user.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';
import 'package:nutrimd/core/widgets/app_button.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/enter_test_results.dart';

import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/logo_title.dart';

class MedicalTestsPage extends StatelessWidget {
  const MedicalTestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      body: SafeArea(
        // Connect the page with The tab bar controller by getx state management.
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and Title view in the top left corner.
              const Align(
                alignment: Alignment.center,
                child: LogoAndTitle(
                  fieldAlignment: CrossAxisAlignment.center,
                  logoWidth: 150,
                ),
              ),
              spaceVertical32(),
              Text(
                "Required Medical Tests",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 22,
                ),
              ),
              Text(
                "FOR YOU",
                style: TextStyle(
                  color: AppColors.secondColor,
                  fontSize: 22,
                ),
              ),
              Text(
                "Cholesterol: \n   \o Complete cholesterol test. \n   \o Low-density lipoprotein (LDL) test. \n   \o High-density lipoprotein (HDL) test. \n   \o Triglyceride test.\nPressure: \n   \o Blood pressure measurement.\nSugar: \n   \o Glucose fasting test. \n   \o Oral glucose tolerance test. \n   \o Hemoglobin A1C test.\nObesity:\n   \o weight and height. \n   \o Waist circumference.",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: AppFonts.myP2,
                ),
              ),
              spaceVertical16(),
              AppButton(
                buttonFunction: () {
                  Get.to(EnterTestResults());
                },
                buttonTitle: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
