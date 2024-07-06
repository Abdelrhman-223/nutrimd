/*
**********Project Name: nutrimd
**********File Name: auth_api
**********Created At: 08-May-24 8:54 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimd/api_connection.dart';
import 'package:nutrimd/home_page/presentation/pages/home_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_tests_page.dart';

import '../../../core/utils/app_colors.dart';
import '../../../main.dart';

class AuthApiManager extends GetxController {
  late dynamic responseData;

  signInFunction(Map<String, dynamic> urlRequest) async {
    var url =
        Uri.http(ApiConnections.backendUrlBase, ApiConnections().urlDomains["signIn"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);

    if (responseData["status"] == "success") {
      sharedPreferences.setBool("logging", true);
      sharedPreferences.setString('userId', responseData["personal_data"]["id"].toString());
      sharedPreferences.setString('firstName', responseData["personal_data"]["first_name"].toString());
      sharedPreferences.setString('lastName', responseData["personal_data"]["last_name"].toString());
      sharedPreferences.setString('phoneNum', responseData["personal_data"]["phone_num"].toString());
      sharedPreferences.setString('birthDate', responseData["personal_data"]["date_of_birth"].toString());
      sharedPreferences.setString('email', responseData["personal_data"]["email"].toString());
      sharedPreferences.setString('password', responseData["personal_data"]["password"].toString());
      if (responseData["personal_data"]["gender"] == 0) {
        sharedPreferences.setString("gender", "Male");
      } else {
        sharedPreferences.setString("gender", "Female");
      }

      if (responseData["physical_data"] != false) {
        sharedPreferences.setString(
            "weightObesity", responseData["physical_data"]["weight"].toString());
        sharedPreferences.setString(
            "heightObesity", responseData["physical_data"]["height"].toString());
        sharedPreferences.setString(
            "fatsObesity", responseData["physical_data"]["fats"].toString());
        sharedPreferences.setString(
            "waterObesity", responseData["physical_data"]["water"].toString());
      } else {
        sharedPreferences.setString("weightObesity", "Not Entered Yet");
        sharedPreferences.setString("heightObesity", "Not Entered Yet");
        sharedPreferences.setString("fatsObesity", "Not Entered Yet");
        sharedPreferences.setString("waterObesity", "Not Entered Yet");
      }

      if (responseData["medical_data"] != false) {
        sharedPreferences.setString("triglycerideCholesterol",
            responseData["medical_data"]["triglyceride_cholesterol"].toString());
        sharedPreferences.setString(
            "completeCholesterol", responseData["medical_data"]["complete_cholesterol"].toString());
        sharedPreferences.setString(
            "hdlCholesterol", responseData["medical_data"]["hdl_cholesterol"].toString());
        sharedPreferences.setString(
            "ldlCholesterol", responseData["medical_data"]["ldl_cholesterol"].toString());
        sharedPreferences.setString(
            "diastolicPressure", responseData["medical_data"]["diastolic_pressure"].toString());
        sharedPreferences.setString(
            "systolicPressure", responseData["medical_data"]["systolic_pressure"].toString());
        sharedPreferences.setString(
            "fastingTestSugar", responseData["medical_data"]["fasting_test_diabetes"].toString());
        sharedPreferences.setString(
            "oralTestSugar", responseData["medical_data"]["oral_test_diabetes"].toString());
        sharedPreferences.setString(
            "a1CTestSugar", responseData["medical_data"]["a1c_test_diabetes"].toString());
      } else {
        sharedPreferences.setString("triglycerideCholesterol", "Not Entered Yet");
        sharedPreferences.setString("completeCholesterol", "Not Entered Yet");
        sharedPreferences.setString("hdlCholesterol", "Not Entered Yet");
        sharedPreferences.setString("ldlCholesterol", "Not Entered Yet");
        sharedPreferences.setString("diastolicPressure", "Not Entered Yet");
        sharedPreferences.setString("systolicPressure", "Not Entered Yet");
        sharedPreferences.setString("fastingTestSugar", "Not Entered Yet");
        sharedPreferences.setString("oralTestSugar", "Not Entered Yet");
        sharedPreferences.setString("a1CTestSugar", "Not Entered Yet");
      }
      Get.off(const MyHomePage());
    }
    update();
  }

  signUpFunction(context, Map<String, dynamic> urlRequest) async {
    var url =
        Uri.http(ApiConnections.backendUrlBase, ApiConnections().urlDomains["signUp"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
print("***************statues: ${responseData["status"]}");
    if (responseData["status"] == "success") {
      sharedPreferences.setString('userId', responseData["user_id"].toString());
      Get.off(const MedicalTestsPage());
    } else if(responseData["status"] == "error"){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.redColor,
          alignment: Alignment.center,
          content: Text(
            responseData["message"],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.fifthColor,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
    update();
  }
}
