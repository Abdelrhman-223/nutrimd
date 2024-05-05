/*
**********Project Name: nutrimd
**********File Name: disease_identification
**********Created At: 16-Apr-24 10:53 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:nutrimd/authentication_pages/presentation/manager/auth_data_controller.dart';

class DiseaseIdentification extends GetxController {
  Map<String, double> testsResults = {};
  String gender = "";
  bool userHasCholesterol = false,
      userHasPressure = false,
      userHasSugar = false,
      userHasOpicity = false;

  Map<String, String> testsResultsStatus = {
    "completeCholesterol": "",
    "hdlCholesterol": "",
    "ldlCholesterol": "",
    "triglycerideCholesterol": "",
    "pressure": "",
    "fastingTestSugar": "",
    "oralTestSugar": "",
    "a1CTestSugar": "",
    "obesity": "",
  };

  addResults(Map<String, double> results, String userGender) {
    testsResults = results;
    gender = userGender;
    identifyCholesterol();
    identifyPressure();
    identifySugar();
    identifyOpicity();

    update();
  }

  identifyCholesterol() {
    if (testsResults["completeCholesterol"]! < 200) {
      testsResultsStatus["completeCholesterol"] = "normal";
    } else if (testsResults["completeCholesterol"]! >= 200 &&
        testsResults["completeCholesterol"]! <= 239) {
      testsResultsStatus["completeCholesterol"] = "high";
      userHasCholesterol = true;
    } else if (testsResults["completeCholesterol"]! >= 240) {
      testsResultsStatus["completeCholesterol"] = "very high";
      userHasCholesterol = true;
    }
    //
    if (testsResults["ldlCholesterol"]! < 130) {
      testsResultsStatus["ldlCholesterol"] = "normal";
    } else if (testsResults["ldlCholesterol"]! >= 130 && testsResults["ldlCholesterol"]! <= 159) {
      testsResultsStatus["ldlCholesterol"] = "high";
    } else if (testsResults["ldlCholesterol"]! >= 240) {
      testsResultsStatus["ldlCholesterol"] = "very high";
      userHasCholesterol = true;
    }
    //
    if (gender == "Male") {
      if (testsResults["hdlCholesterol"]! < 40) {
        userHasCholesterol = true;
        testsResultsStatus["hdlCholesterol"] = "low";
      } else if (testsResults["hdlCholesterol"]! >= 40 && testsResults["hdlCholesterol"]! <= 59) {
        testsResultsStatus["hdlCholesterol"] = "normal";
      } else if (testsResults["hdlCholesterol"]! >= 60) {
        testsResultsStatus["hdlCholesterol"] = "high";
      }
    } else {
      if (testsResults["hdlCholesterol"]! < 50) {
        userHasCholesterol = true;
        testsResultsStatus["hdlCholesterol"] = "low";
      } else if (testsResults["hdlCholesterol"]! >= 50 && testsResults["hdlCholesterol"]! <= 69) {
        testsResultsStatus["hdlCholesterol"] = "normal";
      } else if (testsResults["hdlCholesterol"]! >= 70) {
        testsResultsStatus["hdlCholesterol"] = "high";
      }
    }
    //
    if (testsResults["triglycerideCholesterol"]! < 150) {
      testsResultsStatus["triglycerideCholesterol"] = "normal";
    } else if (testsResults["triglycerideCholesterol"]! >= 150 &&
        testsResults["triglycerideCholesterol"]! <= 199) {
      testsResultsStatus["triglycerideCholesterol"] = "high";
      userHasCholesterol = true;
    } else if (testsResults["triglycerideCholesterol"]! >= 200) {
      testsResultsStatus["triglycerideCholesterol"] = "very high";
      userHasCholesterol = true;
    }

    update();
  }

  identifyPressure() {
    double pressureHigh = testsResults["diastolicPressure"]!,
        pressureLow = testsResults["systolicPressure"]!;
    //
    if (pressureHigh < 120 && pressureLow < 80) {
      testsResultsStatus["pressure"] = "normal";
    } else if ((pressureHigh >= 120 && pressureHigh >= 80) &&
        (pressureHigh <= 129 && pressureLow <= 84)) {
      testsResultsStatus["pressure"] = "high";
      userHasPressure = true;
    } else if ((pressureHigh >= 130 && pressureHigh >= 85) &&
        (pressureHigh <= 139 && pressureLow <= 89)) {
      testsResultsStatus["pressure"] = "slightly";
      userHasPressure = true;
    } else if ((pressureHigh >= 140 && pressureHigh >= 9) &&
        (pressureHigh <= 159 && pressureLow <= 99)) {
      testsResultsStatus["pressure"] = "slightlyI";
      userHasPressure = true;
    } else if (pressureHigh >= 160 && pressureHigh >= 100) {
      testsResultsStatus["pressure"] = "slightlyII";
      userHasPressure = true;
    }

    update();
  }

  identifySugar() {
    //
    if (testsResults["fastingTestSugar"]! < 100) {
      testsResultsStatus["fastingTestSugar"] = "normal";
    } else if (testsResults["fastingTestSugar"]! >= 100 &&
        testsResults["fastingTestSugar"]! <= 125) {
      testsResultsStatus["fastingTestSugar"] = "pre-diabetic";
      userHasSugar = true;
    } else if (testsResults["fastingTestSugar"]! >= 126) {
      testsResultsStatus["fastingTestSugar"] = "diabetic";
      userHasSugar = true;
    }
    //
    if (testsResults["oralTestSugar"]! < 140) {
      testsResultsStatus["oralTestSugar"] = "normal";
    } else if (testsResults["oralTestSugar"]! >= 140 && testsResults["oralTestSugar"]! <= 199) {
      testsResultsStatus["oralTestSugar"] = "pre-diabetic";
      userHasSugar = true;
    } else if (testsResults["oralTestSugar"]! >= 200) {
      testsResultsStatus["oralTestSugar"] = "diabetic";
      userHasSugar = true;
    }
    //
    if (testsResults["a1CTestSugar"]! < 5.7) {
      testsResultsStatus["a1CTestSugar"] = "normal";
    } else if (testsResults["a1CTestSugar"]! >= 5.7 && testsResults["a1CTestSugar"]! <= 6.4) {
      testsResultsStatus["a1CTestSugar"] = "high";
      userHasSugar = true;
    } else if (testsResults["a1CTestSugar"]! >= 6.5) {
      testsResultsStatus["a1CTestSugar"] = "diabetic";
      userHasSugar = true;
    }

    update();
  }

  identifyOpicity() {
    double bmi = testsResults["weightObesity"]! /
        (testsResults["heightObesity"]! * testsResults["heightObesity"]!);
    //
    if (bmi < 18.5 && bmi <= 24.9) {
      testsResultsStatus["oralTestSugar"] = "normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      testsResultsStatus["oralTestSugar"] = "over";
      userHasOpicity = true;
    } else if (bmi >= 30) {
      testsResultsStatus["oralTestSugar"] = "obesity";
      userHasOpicity = true;
    }
    update();
  }
}
