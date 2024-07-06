/*
**********Project Name: nutrimd
**********File Name: product_page_button
**********Created At: 01-Jul-24 8:10 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/main.dart';
import 'package:nutrimd/products_page/data/data_sources/product_api_manager.dart';

import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text_field.dart';
import '../manager/used_product_controller.dart';

class ProductPageButton extends StatelessWidget {
  ProductPageButton({super.key, required this.buttonTitle, required this.buttonStatues, required this.productData,});

  final bool buttonStatues;
  final String buttonTitle;
  final Map<String, dynamic> productData;

  String activatedField = "byQuantity";
  double quantityRatio = 0, itemsNumber = 0;

  ProductApiManager productApiManager = ProductApiManager();
  TextEditingController usedItemsNumberController = TextEditingController();
  TextEditingController usedQuantityInGramsController = TextEditingController();

  UsedProductController usedProductController = Get.put(UsedProductController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: AppColors.fourthColor.withOpacity(0.25),
          builder: (context) => Align(
            alignment: Alignment.center,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: AppColors.fourthColor,
              content: StatefulBuilder(builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    spaceVertical16(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activatedField = "byQuantity";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: activatedField == "byQuantity"
                                  ? AppColors.fifthColor
                                  : AppColors.thirdColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "by Quantity",
                              style: TextStyle(
                                fontSize: 14,
                                color: activatedField == "byQuantity"
                                    ? AppColors.thirdColor
                                    : AppColors.fifthColor,
                              ),
                            ),
                          ),
                        ),
                        spaceHiresontal16(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activatedField = "byItem";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: activatedField == "byQuantity"
                                  ? AppColors.thirdColor
                                  : AppColors.fifthColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "by Item",
                              style: TextStyle(
                                fontSize: 14,
                                color: activatedField == "byQuantity"
                                    ? AppColors.fifthColor
                                    : AppColors.thirdColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spaceVertical8(),
                    if (activatedField == "byQuantity")
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppTextField(
                          textFieldTitle: "Used Quantity in Grams",
                          fieldController: usedQuantityInGramsController,
                          fieldKeyboardType:
                          const TextInputType.numberWithOptions(),
                          fieldBackgroundColor: AppColors.fifthColor,
                        ),
                      ),
                    if (activatedField == "byItem")
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppTextField(
                          textFieldTitle: "Used Items Number",
                          fieldController: usedItemsNumberController,
                          fieldKeyboardType:
                          const TextInputType.numberWithOptions(),
                          fieldBackgroundColor: AppColors.fifthColor,
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        if(buttonTitle == "Use"){
                          if (activatedField == "byQuantity") {
                            quantityRatio = double.parse(
                                usedQuantityInGramsController.text) /
                                100;
                            usedProductController.addUsedProduct(
                              context,
                              {
                                "productName": productData["product_name"],
                                "productIngredient": productData["ingredients_text"],
                                "calsValue": productData["energy_100g"].toString(),
                                "usedCalsValue":
                                (productData["energy_100g"] * quantityRatio).toString(),
                                "usedQuantity":
                                usedQuantityInGramsController.text,
                                "carpValue":
                                (productData["carbohydrates_100g"] * quantityRatio).toString(),
                                "proteinValue":
                                (productData["proteins_100g"] * quantityRatio).toString(),
                                "fatsValue":
                                (productData["fat_100g"] * quantityRatio).toString(),
                              },
                            );
                          }
                          if (activatedField == "byItem") {
                            itemsNumber = double.parse(usedItemsNumberController.text);
                            usedProductController.addUsedProduct(
                              context,
                              {
                                "productName": productData["product_name"],
                                "productIngredient": productData["ingredients_text"],
                                "calsValue": productData["energy_100g"].toString(),
                                "usedCalsValue":
                                (productData["energy_100g"] * itemsNumber).toString(),
                                "usedQuantity":
                                usedQuantityInGramsController.text,
                                "carpValue":
                                (productData["carbohydrates_100g"] * itemsNumber).toString(),
                                "proteinValue":
                                (productData["proteins_100g"] * itemsNumber).toString(),
                                "fatsValue":
                                (productData["fat_100g"] * itemsNumber).toString(),
                              },
                            );
                          }
                          productApiManager.useProduct(context, {"user_id": sharedPreferences.getString("userId"),"product_code": productData["product_code"],"product_id": productData["product_id"].toString(),"product_quantity":quantityRatio.toString(),});
                        }else if(buttonTitle == "Buy"){
                          productApiManager.buyProduct(context, {"user_id": sharedPreferences.getString("userId"),"product_code": productData["product_code"],"product_id": productData["product_id"].toString(),"items_num": itemsNumber.toString(),});
                        }
                        if (usedProductController.canUse) {
                          Get.back();
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(15)),
                        ),
                        child: Text(
                          buttonTitle,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.fifthColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.fifthColor,
          border: Border.all(color: buttonStatues?AppColors.secondColor:AppColors.redColor, width: 2)
        ),
        child: Text(
          buttonStatues?buttonTitle:"$buttonTitle Anyway",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: buttonStatues?AppColors.secondColor:AppColors.redColor,
          ),
        ),
      ),
    );
  }
}
