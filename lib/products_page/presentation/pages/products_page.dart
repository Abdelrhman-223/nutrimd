/*
**********Project Name: nutrimd
**********File Name: products_page
**********Created At: 06-May-24 10:14 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimd/core/widgets/page_separator.dart';
import 'package:nutrimd/core/components/product_field.dart';

import '../../../core/styles/dividers.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final List recommendedProducts = [
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
  final List purchased = [
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
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      children: [
        const PageSeparator(separatorTitle: "Recommended Products"),
        spaceVertical8(),
        SizedBox(
          height: 182,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.of(context).size.width - 32,
            itemCount: recommendedProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductField(
                productName: recommendedProducts[index]["productName"],
                productIngredient: recommendedProducts[index]["productIngredient"],
                calsValue: recommendedProducts[index]["calsValue"],
                carpValue: recommendedProducts[index]["carpValue"],
                proteinValue: recommendedProducts[index]["proteinValue"],
                fatsValue: recommendedProducts[index]["fatsValue"],
                activeFieldButton: true,
                fieldButtonTitle: "Buy",
              ),
            ),
          ),
        ),
        const PageSeparator(separatorTitle: "Purchase"),
        spaceVertical16(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recommendedProducts.length,
          itemBuilder: (context, index) => ProductField(
            productName: recommendedProducts[index]["productName"],
            productIngredient: recommendedProducts[index]["productIngredient"],
            calsValue: recommendedProducts[index]["calsValue"],
            carpValue: recommendedProducts[index]["carpValue"],
            proteinValue: recommendedProducts[index]["proteinValue"],
            fatsValue: recommendedProducts[index]["fatsValue"],
            activeFieldButton: true,
            fieldButtonTitle: "Use",
          ),
        ),
      ],
    );
  }
}
