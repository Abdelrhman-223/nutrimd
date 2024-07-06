/*
**********Project Name: nutrimd
**********File Name: used_product_controller
**********Created At: 28-Jun-24 11:30 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/main.dart';

class UsedProductController extends GetxController {
  List<String> savedUsedProductsToday = [];
  late List products;
  List<Map> usedProductsToday = [];
  bool canUse = true;
  Map<String, double> overValueNutrition = {
    "cals": 0,
    "carp": 0,
    "protein": 0,
    "fats": 0,
  };

  addUsedProduct(BuildContext context, Map<String, String> productData) {
    canUse = true;
    overValueNutrition = {
      "cals": 0,
      "carp": 0,
      "protein": 0,
      "fats": 0,
    };
    if (sharedPreferences.getDouble("calsCurrentValue")! +
            double.parse(productData["usedCalsValue"]!) >=
        sharedPreferences.getDouble("bmrWithActivityLevel")!) {
      overValueNutrition["cals"] = (sharedPreferences.getDouble("calsCurrentValue")! +
              double.parse(productData["usedCalsValue"]!)) -
          sharedPreferences.getDouble("bmrWithActivityLevel")!;
      canUse = false;
    }
    if (sharedPreferences.getDouble("carpCurrentValue")! +
            double.parse(productData["carpValue"]!) >=
        sharedPreferences.getDouble("carpMaxValue")!) {
      overValueNutrition["carp"] = (sharedPreferences.getDouble("carpCurrentValue")! +
              double.parse(productData["carpValue"]!)) -
          sharedPreferences.getDouble("carpMaxValue")!;
      canUse = false;
    }
    if (sharedPreferences.getDouble("proteinCurrentValue")! +
            double.parse(productData["proteinValue"]!) >=
        sharedPreferences.getDouble("proteinMaxValue")!) {
      overValueNutrition["protein"] = (sharedPreferences.getDouble("proteinCurrentValue")! +
              double.parse(productData["proteinValue"]!)) -
          sharedPreferences.getDouble("proteinMaxValue")!;
      canUse = false;
    }
    if (sharedPreferences.getDouble("fatsCurrentValue")! +
            double.parse(productData["fatsValue"]!) >=
        sharedPreferences.getDouble("fatsMaxValue")!) {
      overValueNutrition["fats"] = (sharedPreferences.getDouble("fatsCurrentValue")! +
              double.parse(productData["fatsValue"]!)) -
          sharedPreferences.getDouble("fatsMaxValue")!;
      canUse = false;
    }

    if (canUse) {
      if (sharedPreferences.containsKey("usedProductsToday")) {
        savedUsedProductsToday = sharedPreferences.getStringList("usedProductsToday")!;
      }
      savedUsedProductsToday.add(
          '"productName""${productData["productName"]}""productIngredient""${productData["productIngredient"]}""calsValue""${productData["calsValue"]}""usedCalsValue""${productData["usedCalsValue"]}""usedQuantity""${productData["usedQuantity"]}""carpValue""${productData["carpValue"]}""proteinValue""${productData["proteinValue"]}""fatsValue""${productData["fatsValue"]}"');
      sharedPreferences.setStringList("usedProductsToday", savedUsedProductsToday);

      convertProductStringListToMap();
      updateDietProtocol(productData);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.redColor,
          alignment: Alignment.center,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Can't use it right now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fifthColor,
                  fontSize: 18,
                ),
              ),
              if(overValueNutrition["cals"] != 0)
              Text(
                "Overflow Calories by ${overValueNutrition["cals"]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fifthColor,
                  fontSize: 14,
                ),
              ),
              if(overValueNutrition["carp"] != 0)
              Text(
                "Overflow Carp by ${overValueNutrition["carp"]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fifthColor,
                  fontSize: 14,
                ),
              ),
              if(overValueNutrition["protein"] != 0)
              Text(
                "Overflow Protein by ${overValueNutrition["protein"]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fifthColor,
                  fontSize: 14,
                ),
              ),
              if(overValueNutrition["fats"] != 0)
              Text(
                "Overflow Fats by ${overValueNutrition["fats"]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fifthColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }
    update();
  }

  convertProductStringListToMap() {
    products = sharedPreferences.containsKey("usedProductsToday")
        ? sharedPreferences.getStringList("usedProductsToday")!
        : [];
    usedProductsToday = [];
    for (int i = 0; i < products.length; i++) {
      Map<String, String> convertedMap = {};
      String convertedKey = "", convertedValue = "";
      bool startKey = false, startValue = false, keyOrValue = false;
      for (int j = 0; j < products[i].length; j++) {
        if (!keyOrValue) {
          if (products[i][j] == '"') {
            if (startKey) {
              keyOrValue = !keyOrValue;
            }
            startKey = !startKey;
          } else {
            convertedKey += products[i][j];
          }
        } else {
          if (products[i][j] == '"') {
            if (startValue) {
              keyOrValue = !keyOrValue;
              convertedMap.addAll({convertedKey: convertedValue});
              convertedKey = "";
              convertedValue = "";
            }
            startValue = !startValue;
          } else {
            convertedValue += products[i][j];
          }
        }
      }
      usedProductsToday.add(convertedMap);
    }

    update();
  }

  updateDietProtocol(Map<String, String> productData) {
    double calsCurrentValue = sharedPreferences.getDouble("calsCurrentValue")!;
    double carpCurrentValue = sharedPreferences.getDouble("carpCurrentValue")!;
    double proteinCurrentValue = sharedPreferences.getDouble("proteinCurrentValue")!;
    double fatsCurrentValue = sharedPreferences.getDouble("fatsCurrentValue")!;

    calsCurrentValue += double.parse(productData["usedCalsValue"]!);
    carpCurrentValue += double.parse(productData["carpValue"]!);
    proteinCurrentValue += double.parse(productData["proteinValue"]!);
    fatsCurrentValue += double.parse(productData["fatsValue"]!);

    sharedPreferences.setDouble("calsCurrentValue", calsCurrentValue);
    sharedPreferences.setDouble("carpCurrentValue", carpCurrentValue);
    sharedPreferences.setDouble("proteinCurrentValue", proteinCurrentValue);
    sharedPreferences.setDouble("fatsCurrentValue", fatsCurrentValue);

    update();
  }
}
