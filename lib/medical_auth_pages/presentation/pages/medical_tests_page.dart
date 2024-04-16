/*
**********Project Name: nutrimd
**********File Name: medical_tests_page
**********Created At: 15-Apr-24 3:15 PM
**********Author: Abdelrhman Hussein
**********Description: This page to show the medical tests that we need from the user.
*/

import 'package:flutter/material.dart';

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
                  children: [
                    // Logo and Title view in the top left corner.
                    const Align(
                      alignment: Alignment.center,
                      child: LogoAndTitle(fieldAlignment: CrossAxisAlignment.center, logoWidth: 150,),
                    ),
                    spaceVertical32(),
                  ],
                ),
              ),
      ),
    );
  }
}
