/*
**********Project Name: nutrimd
**********File Name: product_field
**********Created At: 05-May-24 12:19 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_icons.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/product_field_nutrition.dart';

import '../utils/app_colors.dart';

class ProductField extends StatelessWidget {
  ProductField({
    super.key,
    required this.productName,
    required this.productIngredient,
    required this.calsValue,
    required this.carpValue,
    required this.proteinValue,
    required this.fatsValue,
    this.activeFieldButton = false,
    this.fieldButtonTitle = "",
    this.showDate = false,
    this.fieldDate = "",
    this.activeUsedField = false,
    this.usedCals = "",
    this.usedQuantity = "",
  });

  final String productName,
      productIngredient,
      calsValue,
      carpValue,
      proteinValue,
      fatsValue,
      fieldButtonTitle,
      fieldDate,
      usedCals,
      usedQuantity;

  final bool activeFieldButton;
  bool activeButton = true, showDate = true, activeUsedField = true;

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
              child: StatefulBuilder(builder: (context, setState) {
                return (activeButton && activeFieldButton)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Text(
                                fieldButtonTitle,
                                style: TextStyle(
                                  color: AppColors.fifthColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeButton = false;
                                });
                              },
                              child: SvgPicture.asset(AppIcons.arrowCircleLeft),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (activeFieldButton)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeButton = true;
                                });
                              },
                              child: SvgPicture.asset(AppIcons.arrowCircleRight),
                            ),
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
                      );
              }),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.mainColor,
                          ),
                        ),
                        (activeUsedField)?
                         Text(
                           "Quantity of use: ${usedQuantity}g",
                           style: TextStyle(
                             fontSize: 12,
                             color: AppColors.thirdColor,
                           ),
                         )
                        :Text(
                          productIngredient,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.fourthColor,
                          ),
                        ),
                        if (showDate)
                          Text(
                            fieldDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.redColor,
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
                  if(activeUsedField)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        gradient: AppColors.vUtDLinearDarkGrid,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Used\nCals",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.fifthColor,
                          ),
                        ),
                        Text(
                          usedCals,
                          style: TextStyle(
                            fontSize: 14,
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
