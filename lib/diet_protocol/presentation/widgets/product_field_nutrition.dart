/*
**********Project Name: nutrimd
**********File Name: product_field_nutrition
**********Created At: 04-May-24 11:50 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';

class ProductFieldNutrition extends StatelessWidget {
  const ProductFieldNutrition({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.fifthColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: AppColors.thirdColor,
                fontFamily: AppFonts.appFontFamily,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: AppColors.mainColor,
                fontFamily: AppFonts.appFontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
