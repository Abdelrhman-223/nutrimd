/*
**********Project Name: nutrimd
**********File Name: product_field
**********Created At: 05-May-24 12:19 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/product_field_nutrition.dart';

import '../../../core/utils/app_colors.dart';

class ProductField extends StatelessWidget {
  const ProductField({
    super.key,
    required this.productName,
    required this.productIngredient,
    required this.calsValue,
    required this.carpValue,
    required this.proteinValue,
    required this.fatsValue,
  });

  final String productName, productIngredient, calsValue, carpValue, proteinValue, fatsValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width - 32,
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                gradient: AppColors.hRtLLinearDarkGrid,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProductFieldNutrition(
                    title: "Carp: ",
                    value: carpValue,
                  ),
                  ProductFieldNutrition(
                    title: "Protein: ",
                    value: proteinValue,
                  ),
                  ProductFieldNutrition(
                    title: "Fats: ",
                    value: fatsValue,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.circular(25),
                border: GradientBoxBorder(
                  gradient: AppColors.hLtRLinearDarkGrid,
                  width: 5,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Text(
                          productIngredient,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.fourthColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        gradient: AppColors.vUtDLinearDarkGrid,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cals",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.fifthColor,
                          ),
                        ),
                        Text(
                          calsValue,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.fifthColor,
                          ),
                        ),
                        Text(
                          "100g",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.fifthColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
