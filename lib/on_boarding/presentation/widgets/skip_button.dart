/*
**********Project Name: nutrimd
**********File Name: skip_button
**********Created At: 14-Apr-24 6:57 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nutrimd/main.dart';
import '../../../authentication_pages/presentation/pages/auth_page.dart';
import '../../../core/utils/app_colors.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../home_page/presentation/pages/home_page.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        sharedPreferences.setBool("finishOnBoarding", true);
        Get.off(const AuthPage());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: AppColors.vUtDLinearDarkGrid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Text(
          "Skip",
        ),
      ),
    );
  }
}
