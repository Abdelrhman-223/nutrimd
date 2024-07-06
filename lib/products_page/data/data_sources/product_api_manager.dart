/*
**********Project Name: nutrimd
**********File Name: product_api_manager
**********Created At: 03-Jul-24 7:16 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:convert';
import 'package:get/get.dart';
import 'package:nutrimd/core/widgets/code_toast.dart';
import 'package:flutter/material.dart';
import 'package:nutrimd/products_page/presentation/pages/products_page.dart';
import '../../../api_connection.dart';
import 'package:http/http.dart' as http;

class ProductApiManager extends GetxController {

  List<Map<String, dynamic>> buyedProductsData = [];

  useProduct(context, Map<String, dynamic> urlRequest) async {
    late dynamic responseData;
    var url = Uri.http(
        ApiConnections.backendUrlBase, ApiConnections().urlDomains["useProduct"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);

    if (responseData["status"] == "success") {
      codeToast(responseData["message"]);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(),));
    }
    update();
  }
  buyProduct(context, Map<String, dynamic> urlRequest) async {
    late dynamic responseData;
    var url = Uri.http(
        ApiConnections.backendUrlBase, ApiConnections().urlDomains["buyProduct"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);

    if (responseData["status"] == "success") {
      codeToast(responseData["message"]);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(),));
    }
    update();
  }
  buyedProduct(Map<String, dynamic> urlRequest) async {
    late dynamic responseData;
    var url = Uri.http(
        ApiConnections.backendUrlBase, ApiConnections().urlDomains["buyedProduct"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);

    if (responseData["status"] == "success") {
      buyedProductsData.addAll(responseData["data"]);
    }
    update();
  }

}