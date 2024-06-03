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
import 'package:nutrimd/home_page/presentation/pages/home_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_tests_page.dart';

class ApiConnections {
  //192.168.199.119 //// 10.0.2.2:80 //// 192.168.1.9:80
  // static String urlBase = "192.168.199.119:80";
  // chatbot base url = 192.168.1.23:5000
  static String urlBase = "192.168.251.113:5000";
  Map<String, String> urlDomains = {
    "signIn": "nutrimd_php/authentication/sign_in.php",
    "signUp": "nutrimd_php/authentication/sign_up.php",

    "medicalResults": "nutrimd_php/enter_data/medical_data.php",
    "physicalResults": "nutrimd_php/enter_data/physical_data.php",

    "chatbot": "chatbot"
  };
}
