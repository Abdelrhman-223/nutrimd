/*
**********Project Name: nutrimd
**********File Name: history_page
**********Created At: 06-May-24 2:47 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/history_page/presentation/manager/history_tab_controller.dart';
import 'package:nutrimd/history_page/presentation/widgets/history_tab_bar.dart';
import '../../../core/components/product_field.dart';
import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final List usedProducts = [
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
  final List purchasedProducts = [
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
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      body: SafeArea(
        // Connect the page with The tab bar controller by getx state management.
        child: GetBuilder<HistoryTabController>(
            init: HistoryTabController(),
            builder: (historyTabController) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spaceVertical16(),
                    const HistoryTabBar(),
                    spaceVertical32(),
                    // View the pages in page view to easy switch between them and i put it in expanded widget to take the rest of the body height.
                    Expanded(
                      child: PageView(
                        controller: historyTabController.pageController,
                        onPageChanged: (value) {
                          // Change the page by scrolling, if the page on index 0 will go to the Sign-In page and if it 1 will go to Sign-Up page.
                          (value == 0)
                              ? historyTabController.tabOnUsed()
                              : historyTabController.tabOnPurchased();
                        },
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: usedProducts.length,
                            itemBuilder: (context, index) => ProductField(
                              productName: usedProducts[index]["productName"],
                              productIngredient: usedProducts[index]["productIngredient"],
                              calsValue: usedProducts[index]["calsValue"],
                              carpValue: usedProducts[index]["carpValue"],
                              proteinValue: usedProducts[index]["proteinValue"],
                              fatsValue: usedProducts[index]["fatsValue"],
                              activeUsedField: true,
                              usedCals: "640",
                              usedQuantity: "80",
                              showDate: true,
                              fieldDate: DateTime.now().toString().substring(0, 10),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: purchasedProducts.length,
                            itemBuilder: (context, index) => ProductField(
                              productName: purchasedProducts[index]["productName"],
                              productIngredient: purchasedProducts[index]["productIngredient"],
                              calsValue: purchasedProducts[index]["calsValue"],
                              carpValue: purchasedProducts[index]["carpValue"],
                              proteinValue: purchasedProducts[index]["proteinValue"],
                              fatsValue: purchasedProducts[index]["fatsValue"],
                              activeFieldButton: true,
                              fieldButtonTitle: "Re-Buy",
                              showDate: true,
                              fieldDate: DateTime.now().toString().substring(0, 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
