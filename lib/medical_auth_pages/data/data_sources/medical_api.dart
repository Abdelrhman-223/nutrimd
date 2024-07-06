/*
**********Project Name: nutrimd
**********File Name: medical_api
**********Created At: 09-May-24 10:06 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimd/api_connection.dart';
import '../../../main.dart';
import '../../presentation/pages/medical_results_page.dart';

class MedicalApiManager extends GetxController {
  late dynamic responseData;

  medicalAuthFunction(Map<String, String> urlRequest) async {
    var url = Uri.http(ApiConnections.backendUrlBase, ApiConnections().urlDomains["medicalResults"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    update();
  }

  physicalAuthFunction(Map<String, String> urlRequest) async {
    var url = Uri.http(ApiConnections.backendUrlBase, ApiConnections().urlDomains["physicalResults"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    if (responseData["status"] == "success") {
      sharedPreferences.setBool("finishEnterMedicalData", true);
      Get.to(MedicalResults());
    }
    update();
  }

  addUserDiseases(Map<String, String> urlRequest) async {
    var url = Uri.http(ApiConnections.backendUrlBase, ApiConnections().urlDomains["userDiseases"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    update();
  }

  addUserDiet(Map<String, String> urlRequest) async {
    var url = Uri.http(ApiConnections.backendUrlBase, ApiConnections().urlDomains["userDiet"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    update();
  }
}
