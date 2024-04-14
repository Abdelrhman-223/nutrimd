/*
**********Project Name: nutrimd
**********File Name: app_button
**********Created At: 14-Apr-24 3:09 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.buttonFunction, required this.buttonTitle});

  final Function buttonFunction;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonFunction;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: GradientBoxBorder(gradient: AppColors.vUtDLinearDarkGrid, width: 3),
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: AppFonts.myH7,
          ),
        ),
      ),
    );
  }
}
