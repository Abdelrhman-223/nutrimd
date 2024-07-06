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
import 'package:get/get.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/widgets/page_separator.dart';
import 'package:nutrimd/diet_protocol/presentation/manager/diet_protocol_controller.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/calories_bar.dart';
import 'package:nutrimd/diet_protocol/presentation/widgets/nutrition_bar.dart';
import 'package:nutrimd/core/components/product_field.dart';
import 'package:nutrimd/main.dart';
import 'package:nutrimd/products_page/presentation/pages/product_page.dart';
import '../../../products_page/presentation/manager/used_product_controller.dart';

class DietProtocolPage extends StatefulWidget {
  const DietProtocolPage({super.key});

  @override
  State<DietProtocolPage> createState() => _DietProtocolPageState();
}

class _DietProtocolPageState extends State<DietProtocolPage> {
  DietProtocolController dietProtocolController = Get.put(DietProtocolController());
  UsedProductController usedProductController = Get.put(UsedProductController());

  @override
  void initState() {
    sharedPreferences.remove("usedProductsToday");
    dietProtocolController.calculateBMR();
    ////usedProductController.convertProductStringListToMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsedProductController>(
        init: UsedProductController(),
        builder: (usedProductController) => ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                CaloriesBar(
                  title: "Calories",
                  totalValue: sharedPreferences.getDouble("bmrWithActivityLevel")!.toString(),
                  currentValue: sharedPreferences.getDouble("calsCurrentValue")!.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NutritionBar(
                        title: "Carp",
                        minTotalValue: sharedPreferences.getDouble("carpMinValue").toString(),
                        maxTotalValue: sharedPreferences.getDouble("carpMaxValue").toString(),
                        currentValue: sharedPreferences.getDouble("carpCurrentValue")!.toString(),
                        upSideDown: false,
                      ),
                      NutritionBar(
                        title: "Protein",
                        minTotalValue: sharedPreferences.getDouble("proteinMinValue").toString(),
                        maxTotalValue: sharedPreferences.getDouble("proteinMaxValue").toString(),
                        currentValue:
                            sharedPreferences.getDouble("proteinCurrentValue")!.toString(),
                        upSideDown: true,
                      ),
                      NutritionBar(
                        title: "Fats",
                        minTotalValue: sharedPreferences.getDouble("fatsMinValue").toString(),
                        maxTotalValue: sharedPreferences.getDouble("fatsMaxValue").toString(),
                        currentValue: sharedPreferences.getDouble("fatsCurrentValue")!.toString(),
                        upSideDown: false,
                      ),
                    ],
                  ),
                ),
                const PageSeparator(separatorTitle: "Nutrient Used Today"),
                spaceVertical16(),
                ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: usedProductController.usedProductsToday.length,
                  itemBuilder: (context, index) => ProductField(
                    activeUsedField: true,
                    usedCals: usedProductController.usedProductsToday[index]["usedCalsValue"]
                        .toString()
                        .substring(0, 5),
                    usedQuantity: usedProductController.usedProductsToday[index]["usedQuantity"],
                    productName: usedProductController.usedProductsToday[index]["productName"],
                    productIngredient:
                        usedProductController.usedProductsToday[index]["productIngredient"] ?? "",
                    calsValue: usedProductController.usedProductsToday[index]["calsValue"] ?? "",
                    carpValue: usedProductController.usedProductsToday[index]["carpValue"] ?? "",
                    proteinValue:
                        usedProductController.usedProductsToday[index]["proteinValue"] ?? "",
                    fatsValue: usedProductController.usedProductsToday[index]["fatsValue"] ?? "",
                  ),
                ),
              ],
            ));
  }
}
