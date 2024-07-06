/*
**********Project Name: nutrimd
**********File Name: calories_bar
**********Created At: 04-May-24 8:29 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/utils/app_colors.dart';

class CaloriesBar extends StatelessWidget {
  const CaloriesBar({
    super.key,
    required this.title,
    required this.currentValue,
    required this.totalValue,
  });

  final String title, currentValue, totalValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(25),
                  right: Radius.circular(50),
                ),
                border: GradientBoxBorder(
                  gradient: AppColors.hLtRLinearDarkGrid,
                  width: 5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    totalValue.length < 6 ? totalValue : totalValue.substring(0,6),
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.circular(50),
                border: GradientBoxBorder(gradient: AppColors.hRtLLinearDarkGrid, width: 10),
              ),
              child: Text(
                currentValue.length < 6 ? currentValue : currentValue.substring(0,6),
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
