/*
**********Project Name: nutrimd
**********File Name: api_connection
**********Created At: 15-Apr-24 10:27 PM
**********Author: Abdelrhman Hussein
**********Description: This page to manage the api code.
*/

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimd/home_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_tests_page.dart';

class ApiManager extends GetxController {
  //192.168.199.119 //// 10.0.2.2:80 //// 192.168.1.9:80
  // static String urlBase = "192.168.199.119:80";
  // chatbot base url = 192.168.1.23:5000
  static String urlBase = "192.168.1.25:5000";
  Map<String, String> urlDomains = {
    "signIn": "nutrimd_php/authentication/sign_in.php",
    "signUp": "nutrimd_php/authentication/sign_up.php",

    "chatbot": "chatbot/quit"
  };

  late var responseData;

  signInFunction(Map<String, dynamic> urlRequest) async {
    print("///////////////////");
    var url = Uri.http(urlBase, urlDomains["signIn"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);

    print("Status is ${responseData["status"]}");
    if(responseData["status"] == "success") {
      Get.off(const MyHomePage());
    } else {
      print("Fill to sign in");
    }
    update();
  }
  signUpFunction(Map<String, dynamic> urlRequest) async {
    var url = Uri.http(urlBase, urlDomains["signUp"]!, urlRequest);
    var response = await http.post(url);
    responseData = jsonDecode(response.body);

    print("Status is ${responseData["status"]}");
    if(responseData["status"] == "success") {
      Get.off(const MedicalTestsPage());
    } else {
      print("Fill to sign in");
    }
    update();
  }

}
