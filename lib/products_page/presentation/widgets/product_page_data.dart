/*
**********Project Name: nutrimd
**********File Name: product_page_data
**********Created At: 03-Jul-24 5:01 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:nutrimd/core/widgets/page_separator.dart';
import 'package:nutrimd/core/widgets/product_statues.dart';
import 'package:nutrimd/products_page/presentation/widgets/macro_nutrition_bars.dart';
import 'package:nutrimd/products_page/presentation/widgets/product_page_button.dart';

import '../../../core/utils/app_colors.dart';

class ProductPageData extends StatelessWidget {
  const ProductPageData({super.key, required this.productStatues, required this.productData});

  final bool productStatues;
  final Map<String, dynamic> productData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        ProductStatues(productStatues: productStatues),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: AppColors.fourthColor,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(productData["img"]))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                productData["product_code"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                productData["product_name"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondColor,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MacroNutritionBars(
                  fieldTitle: "Carp", fieldValue: productData["carbohydrates_100g"].toString()),
              MacroNutritionBars(
                  fieldTitle: "Protein", fieldValue: productData["proteins_100g"].toString()),
              MacroNutritionBars(
                  fieldTitle: "Fats", fieldValue: productData["fat_100g"].toString()),
            ],
          ),
        ),
        const PageSeparator(separatorTitle: "Ingredients"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            productData["ingredients_text"],
            softWrap: true,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.fourthColor,
            ),
          ),
        ),
        const PageSeparator(separatorTitle: "Nutrition"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Nutrition, Nutrition, Nutrition, Nutrition, Nutrition, Nutrition, Nutrition, Nutrition, ",
            softWrap: true,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.fourthColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: ProductPageButton(
            buttonTitle: "Buy",
            buttonStatues: productStatues,
            productData: productData,
          ),
        ),
      ],
    );
  }
}
