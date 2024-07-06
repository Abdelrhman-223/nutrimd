/*
**********Project Name: nutrimd
**********File Name: disease_identification
**********Created At: 16-Apr-24 10:53 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:nutrimd/main.dart';

class DiseaseIdentification extends GetxController {
  Map<String, dynamic> medicalTestsResults = {}, physicalTestsResults = {};
  String gender = "";

  bool userHasCholesterol = false,
      userHasPressure = false,
      userHasDiabetes = false,
      userHasObesity = false;

  Map<String, String> testsResultsStatus = {
    "complete_cholesterol": "",
    "hdl_cholesterol": "",
    "ldl_cholesterol": "",
    "triglyceride_cholesterol": "",
    "pressure": "",
    "fasting_test_diabetes": "",
    "oral_test_diabetes": "",
    "a1c_test_diabetes": "",
    "obesity": "",
  };

  addResults(Map<String, dynamic> medicalResults, Map<String, dynamic> physicalResults,
      String userGender) {
    medicalTestsResults = medicalResults;
    physicalTestsResults = physicalResults;
    gender = userGender;

    identifyCholesterol();
    identifyPressure();
    identifyDiabetes();
    identifyObesity();

    sharedPreferences.setBool("userHasCholesterol", userHasCholesterol);
    sharedPreferences.setBool("userHasPressure", userHasPressure);
    sharedPreferences.setBool("userHasDiabetes", userHasDiabetes);
    sharedPreferences.setBool("userHasObesity", userHasObesity);

    sharedPreferences.setString(
        "complete_cholesterol", testsResultsStatus["complete_cholesterol"]!);
    sharedPreferences.setString("hdl_cholesterol", testsResultsStatus["hdl_cholesterol"]!);
    sharedPreferences.setString("ldl_cholesterol", testsResultsStatus["ldl_cholesterol"]!);
    sharedPreferences.setString(
        "triglyceride_cholesterol", testsResultsStatus["triglyceride_cholesterol"]!);
    sharedPreferences.setString("pressure", testsResultsStatus["pressure"]!);
    sharedPreferences.setString(
        "fasting_test_diabetes", testsResultsStatus["fasting_test_diabetes"]!);
    sharedPreferences.setString("oral_test_diabetes", testsResultsStatus["oral_test_diabetes"]!);
    sharedPreferences.setString("a1c_test_diabetes", testsResultsStatus["a1c_test_diabetes"]!);
    sharedPreferences.setString("obesity", testsResultsStatus["obesity"]!);

    update();
  }

  identifyCholesterol() {
    double completeCholesterol = double.parse(medicalTestsResults["complete_cholesterol"]!);
    double ldlCholesterol = double.parse(medicalTestsResults["ldl_cholesterol"]!);
    double hdlCholesterol = double.parse(medicalTestsResults["hdl_cholesterol"]!);
    double triglycerideCholesterol = double.parse(medicalTestsResults["triglyceride_cholesterol"]!);

    //
    if (completeCholesterol < 200) {
      testsResultsStatus["complete_cholesterol"] = "normal";
    } else if (completeCholesterol >= 200 && completeCholesterol <= 239) {
      testsResultsStatus["complete_cholesterol"] = "high";
      userHasCholesterol = true;
    } else if (completeCholesterol >= 240) {
      testsResultsStatus["complete_cholesterol"] = "very high";
      userHasCholesterol = true;
    }
    //
    if (ldlCholesterol < 130) {
      testsResultsStatus["ldl_cholesterol"] = "normal";
    } else if (ldlCholesterol >= 130 && ldlCholesterol <= 159) {
      testsResultsStatus["ldl_cholesterol"] = "high";
    } else if (ldlCholesterol >= 240) {
      testsResultsStatus["ldl_cholesterol"] = "very high";
      userHasCholesterol = true;
    }
    //
    if (gender == "Male") {
      if (hdlCholesterol < 40) {
        userHasCholesterol = true;
        testsResultsStatus["hdl_cholesterol"] = "low";
      } else if (hdlCholesterol >= 40 && hdlCholesterol <= 59) {
        testsResultsStatus["hdl_cholesterol"] = "normal";
      } else if (hdlCholesterol >= 60) {
        testsResultsStatus["hdl_cholesterol"] = "high";
      }
    } else {
      if (hdlCholesterol < 50) {
        userHasCholesterol = true;
        testsResultsStatus["hdl_cholesterol"] = "low";
      } else if (hdlCholesterol >= 50 && hdlCholesterol <= 69) {
        testsResultsStatus["hdl_cholesterol"] = "normal";
      } else if (hdlCholesterol >= 70) {
        testsResultsStatus["hdl_cholesterol"] = "high";
      }
    }
    //
    if (triglycerideCholesterol < 150) {
      testsResultsStatus["triglyceride_cholesterol"] = "normal";
    } else if (triglycerideCholesterol >= 150 && triglycerideCholesterol <= 199) {
      testsResultsStatus["triglyceride_cholesterol"] = "high";
      userHasCholesterol = true;
    } else if (triglycerideCholesterol >= 200) {
      testsResultsStatus["triglyceride_cholesterol"] = "very high";
      userHasCholesterol = true;
    }

    update();
  }

  identifyPressure() {
    double pressureHigh = double.parse(medicalTestsResults["diastolic_pressure"]!),
        pressureLow = double.parse(medicalTestsResults["systolic_pressure"]!);
    //
    if (pressureHigh <= 120 && pressureLow <= 80) {
      testsResultsStatus["pressure"] = "normal";
    } else if ((pressureHigh > 120 && pressureHigh > 80) &&
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

  identifyDiabetes() {
    double fastingTestDiabetes = double.parse(medicalTestsResults["fasting_test_diabetes"]!);
    double oralTestDiabetes = double.parse(medicalTestsResults["oral_test_diabetes"]!);
    double a1cTestDiabetes = double.parse(medicalTestsResults["a1c_test_diabetes"]!);
    //
    if (fastingTestDiabetes < 100) {
      testsResultsStatus["fasting_test_diabetes"] = "normal";
    } else if (fastingTestDiabetes >= 100 && fastingTestDiabetes <= 125) {
      testsResultsStatus["fasting_test_diabetes"] = "pre-diabetic";
      userHasDiabetes = true;
    } else if (fastingTestDiabetes >= 126) {
      testsResultsStatus["fasting_test_diabetes"] = "diabetic";
      userHasDiabetes = true;
    }
    //
    if (oralTestDiabetes < 140) {
      testsResultsStatus["oral_test_diabetes"] = "normal";
    } else if (oralTestDiabetes >= 140 && oralTestDiabetes <= 199) {
      testsResultsStatus["oral_test_diabetes"] = "pre-diabetic";
      userHasDiabetes = true;
    } else if (oralTestDiabetes >= 200) {
      testsResultsStatus["oral_test_diabetes"] = "diabetic";
      userHasDiabetes = true;
    }
    //
    if (a1cTestDiabetes < 5.7) {
      testsResultsStatus["a1c_test_diabetes"] = "normal";
    } else if (a1cTestDiabetes >= 5.7 && a1cTestDiabetes <= 6.4) {
      testsResultsStatus["a1c_test_diabetes"] = "high";
      userHasDiabetes = true;
    } else if (a1cTestDiabetes >= 6.5) {
      testsResultsStatus["a1c_test_diabetes"] = "diabetic";
      userHasDiabetes = true;
    }

    update();
  }

  identifyObesity() {
    double bmi = sharedPreferences.getDouble("bmi")!;
    //
    if (bmi <= 20) {
      testsResultsStatus["obesity"] = "low";
    } else if (bmi > 20 && bmi <= 24.9) {
      testsResultsStatus["obesity"] = "normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      testsResultsStatus["obesity"] = "over";
      userHasObesity = true;
    } else if (bmi >= 30) {
      testsResultsStatus["obesity"] = "obesity";
      userHasObesity = true;
    }
    update();
  }
}
