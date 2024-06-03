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
  late var responseData;

  medicalAuthFunction(Map<String, String> urlRequest) async {
    var url = Uri.http(ApiConnections.urlBase, ApiConnections().urlDomains["medicalResults"]!, urlRequest);
    print(url);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    print("Status is ${responseData["status"]}");
    update();
  }

  physicalAuthFunction(Map<String, String> urlRequest) async {
    var url = Uri.http(ApiConnections.urlBase, ApiConnections().urlDomains["physicalResults"]!, urlRequest);
    print(url);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    print("Status is ${responseData["status"]}");
    if (responseData["status"] == "success") {
      sharedPreferences.setBool("finishEnterMedicalData", true);
      Get.to(const MedicalResults());
    }
    update();
  }
}
