/*
**********Project Name: nutrimd
**********File Name: macro_nutrition_bars
**********Created At: 01-Jul-24 7:59 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/utils/app_colors.dart';

class MacroNutritionBars extends StatelessWidget {
  const MacroNutritionBars({super.key, required this.fieldTitle, required this.fieldValue});

  final String fieldTitle, fieldValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 105,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.fifthColor,
        borderRadius: BorderRadius.circular(55),
        border: GradientBoxBorder(gradient: AppColors.vUtDLinearDarkGrid, width: 10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fieldTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
            ),
          ),
          Text(
            fieldValue,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
