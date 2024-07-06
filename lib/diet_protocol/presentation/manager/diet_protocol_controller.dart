/*
**********Project Name: nutrimd
**********File Name: diet_protocol_controller
**********Created At: 22-Jun-24 5:16 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:nutrimd/main.dart';

class DietProtocolController extends GetxController {
  /*
    Owen et al. (2006):
      • BMR = (10 * weight in kg) + (6.25 * height in cm) - (5 * age) + (5) for men with BMI > 25
      • BMR = (9.6 * weight in kg) + (6.25 * height in cm) - (5 * age) + (5) for women with BMI > 25
  */

  double bmr = 0,
      bmrWithActivityLevel = 0,
      weight = sharedPreferences.getDouble("weightObesity")!,
      height = sharedPreferences.getDouble("heightObesity")!;

  double carpMaxValue = 0,
      proteinMaxValue = 0,
      fatsMaxValue = 0,
      carpMinValue = 0,
      proteinMinValue = 0,
      fatsMinValue = 0;

  int age =
      DateTime.now().year - int.parse(sharedPreferences.getString("birthDate")!.substring(0, 4));

   calculateBMR() {
    if (sharedPreferences.getString("gender")! == "Male") {
      bmr = (10 * weight) + (6.25 * height * 100) - (5 * age);
    } else {
      bmr = (9.6 * weight) + (6.25 * height * 100) - (5 * age);
    }

    if(sharedPreferences.containsKey("activityLevel")) {
      bmrWithActivityLevel = bmr * sharedPreferences.getDouble("activityLevel")!;
    }

    if (sharedPreferences.getDouble("bmi")! > 25) {
      bmrWithActivityLevel -= 500;
    } else if (sharedPreferences.getDouble("bmi")! < 20) {
      bmrWithActivityLevel += 500;
    }
    sharedPreferences.setDouble("bmr", bmr);
    sharedPreferences.setDouble("bmrWithActivityLevel", bmrWithActivityLevel);
    calculateMacroNutrient();

    update();
  }

  calculateMacroNutrient() {
    if (sharedPreferences.getBool(
            "userHasCholesterol")! /*&&
        !sharedPreferences.getBool("userHasPressure")! &&
        !sharedPreferences.getBool("userHasDiabetes")! &&
        !sharedPreferences.getBool("userHasObesity")!*/
        ) {
      //just has Cholesterol
      carpMinValue = bmrWithActivityLevel * 0.45;
      carpMaxValue = bmrWithActivityLevel * 0.65;

      proteinMinValue = bmrWithActivityLevel * 0.10;
      proteinMaxValue = bmrWithActivityLevel * 0.35;

      fatsMinValue = bmrWithActivityLevel * 0.20;
      fatsMaxValue = bmrWithActivityLevel * 0.35;
    } else if (/*!sharedPreferences.getBool("userHasCholesterol")! &&*/
        sharedPreferences.getBool(
            "userHasPressure")! /*&&
        !sharedPreferences.getBool("userHasDiabetes")! &&
        !sharedPreferences.getBool("userHasObesity")!*/
        ) {
      //just has Pressure
      carpMinValue = bmrWithActivityLevel * 0.50;
      carpMaxValue = bmrWithActivityLevel * 0.60;

      proteinMinValue = bmrWithActivityLevel * 0.15;
      proteinMaxValue = bmrWithActivityLevel * 0.20;

      fatsMinValue = bmrWithActivityLevel * 0.20;
      fatsMaxValue = bmrWithActivityLevel * 0.30;
    } else if (/*!sharedPreferences.getBool("userHasCholesterol")! &&
        !sharedPreferences.getBool("userHasPressure")! &&*/
        sharedPreferences.getBool(
            "userHasDiabetes")! /* &&
        !sharedPreferences.getBool("userHasObesity")!*/
        ) {
      //just has Diabetes
      carpMinValue = bmrWithActivityLevel * 0.45;
      carpMaxValue = bmrWithActivityLevel * 0.55;

      proteinMinValue = bmrWithActivityLevel * 0.15;
      proteinMaxValue = bmrWithActivityLevel * 0.25;

      fatsMinValue = bmrWithActivityLevel * 0.20;
      fatsMaxValue = bmrWithActivityLevel * 0.35;
    } else if (/*!sharedPreferences.getBool("userHasCholesterol")! &&
        !sharedPreferences.getBool("userHasPressure")! &&
        !sharedPreferences.getBool("userHasDiabetes")! &&*/
        sharedPreferences.getBool("userHasObesity")!) {
      //just has Obesity
      carpMinValue = bmrWithActivityLevel * 0.45;
      carpMaxValue = bmrWithActivityLevel * 0.65;

      proteinMinValue = bmrWithActivityLevel * 0.15;
      proteinMaxValue = bmrWithActivityLevel * 0.25;

      fatsMinValue = bmrWithActivityLevel * 0.20;
      fatsMaxValue = bmrWithActivityLevel * 0.35;
    } else if (!sharedPreferences.getBool("userHasCholesterol")! &&
        !sharedPreferences.getBool("userHasPressure")! &&
        !sharedPreferences.getBool("userHasDiabetes")! &&
        !sharedPreferences.getBool("userHasObesity")!) {
      //dose not has any diseases
      carpMinValue = bmrWithActivityLevel * 0.45;
      carpMaxValue = bmrWithActivityLevel * 0.65;

      proteinMinValue = bmrWithActivityLevel * 0.10;
      proteinMaxValue = bmrWithActivityLevel * 0.35;

      fatsMinValue = bmrWithActivityLevel * 0.20;
      fatsMaxValue = bmrWithActivityLevel * 0.35;
    }

    carpMinValue /= 4;
    carpMaxValue /= 4;
    proteinMinValue /= 4;
    proteinMaxValue /= 4;
    fatsMinValue /= 9;
    fatsMaxValue /= 9;

    sharedPreferences.setDouble("carpMaxValue", carpMaxValue);
    sharedPreferences.setDouble("proteinMaxValue", proteinMaxValue);
    sharedPreferences.setDouble("fatsMaxValue", fatsMaxValue);
    sharedPreferences.setDouble("carpMinValue", carpMinValue);
    sharedPreferences.setDouble("proteinMinValue", proteinMinValue);
    sharedPreferences.setDouble("fatsMinValue", fatsMinValue);

    sharedPreferences.setDouble("calsCurrentValue", 0);
    sharedPreferences.setDouble("carpCurrentValue", 0);
    sharedPreferences.setDouble("proteinCurrentValue", 0);
    sharedPreferences.setDouble("fatsCurrentValue", 0);
  }
}
