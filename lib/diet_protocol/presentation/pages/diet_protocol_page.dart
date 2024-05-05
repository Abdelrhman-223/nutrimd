/*
**********Project Name: nutrimd
**********File Name: diet_protocol_page
**********Created At: 04-May-24 11:07 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/calories_bar.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/nutrition_bar.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/product_field.dart';

class DietProtocolPage extends StatelessWidget {
  DietProtocolPage({super.key});

  final List products = [
    {
      "productName": "Orange Juice",
      "productIngredient": "ingredients,  ingredients,  ingredients  ingredients...",
      "calsValue": "700",
      "carpValue": "10",
      "proteinValue": "12",
      "fatsValue": "1",
    },
    {
      "productName": "Orange Juice",
      "productIngredient": "ingredients,  ingredients,  ingredients  ingredients...",
      "calsValue": "700",
      "carpValue": "10",
      "proteinValue": "12",
      "fatsValue": "1",
    },
    {
      "productName": "Orange Juice",
      "productIngredient": "ingredients,  ingredients,  ingredients  ingredients...",
      "calsValue": "700",
      "carpValue": "10",
      "proteinValue": "12",
      "fatsValue": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CaloriesBar(
            title: "Calories",
            currentValue: "2805",
            totalValue: "1250",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutritionBar(
                  title: "Carp",
                  totalValue: "1000",
                  currentValue: "520",
                  upSideDown: false,
                ),
                NutritionBar(
                  title: "Protein",
                  totalValue: "820",
                  currentValue: "400",
                  upSideDown: true,
                ),
                NutritionBar(
                  title: "Fats",
                  totalValue: "615",
                  currentValue: "320",
                  upSideDown: false,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.hLtRLinearDarkGrid,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              child: Text(
                "Nutrient Used",
                style: TextStyle(
                  color: AppColors.fifthColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          spaceVertical16(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) => ProductField(
                productName: products[index]["productName"],
                productIngredient: products[index]["productIngredient"],
                calsValue: products[index]["calsValue"],
                carpValue: products[index]["carpValue"],
                proteinValue: products[index]["proteinValue"],
                fatsValue: products[index]["fatsValue"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
