/*
**********Project Name: nutrimd
**********File Name: nutrition_bar
**********Created At: 04-May-24 7:23 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/utils/app_colors.dart';

class NutritionBar extends StatelessWidget {
  const NutritionBar(
      {super.key,
      required this.title,
      required this.totalValue,
      required this.currentValue,
      required this.upSideDown});

  final String title, currentValue, totalValue;
  final bool upSideDown;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 75,
              alignment: upSideDown ? Alignment.topCenter : Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.vertical(
                  bottom: upSideDown ? const Radius.circular(50) : const Radius.circular(25),
                  top: upSideDown ? const Radius.circular(25) : const Radius.circular(50),
                ),
                border: GradientBoxBorder(
                    gradient:
                        upSideDown ? AppColors.vUtDLinearDarkGrid : AppColors.vDtULinearDarkGrid,
                    width: 5),
              ),
              child: Column(
                mainAxisAlignment: upSideDown ? MainAxisAlignment.start : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    totalValue,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: upSideDown ? Alignment.bottomCenter : Alignment.topCenter,
            child: Container(
              width: 90,
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.circular(50),
                border: GradientBoxBorder(
                    gradient:
                        upSideDown ? AppColors.vDtULinearDarkGrid : AppColors.vUtDLinearDarkGrid,
                    width: 10),
              ),
              child: Text(
                currentValue,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
