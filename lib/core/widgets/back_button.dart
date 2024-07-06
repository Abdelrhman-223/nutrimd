/*
**********Project Name: nutrimd
**********File Name: back_button
**********Created At: 01-Jul-24 5:39 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(AppIcons.backButton),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Go Back",
                style: TextStyle(
                  color: AppColors.fifthColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
