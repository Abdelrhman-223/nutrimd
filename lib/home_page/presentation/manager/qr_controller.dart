/*
**********Project Name: nutrimd
**********File Name: qr_function
**********Created At: 16-Mar-24 5:18 PM
**********Author: Abdelrhman Hussein
**********Description: the function of the qr code scanner.
*/

import 'dart:convert';
import 'package:nutrimd/products_data.dart';
import 'package:nutrimd/products_page/presentation/pages/product_page.dart';

import '../../../main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../api_connection.dart';
import '../../../core/widgets/code_toast.dart';
import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class QrScannerController extends GetxController {
  String? qrCode;
  bool? productStatues;
  List<String> conditions = [];
  String recommendedProductCode = "";
  Map<String, dynamic> recommendedProductData = {};

  qrScanner(BuildContext context) {
    /// I'm editing the package source code to make some variations of the widget.
    // This code to create an instance of the package.
    final qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
    qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
      //It takes the context of the parent widget to show it correctly.
      context: context,
      onCode: (scan) {
        //when the qr codee scanned will show toast to view the code as text.
        codeToast(scan);
        qrCode = scan;
        qrScanFromApp(context, {"code": scan});
      },
    );

    update();
  }

  qrScanFromApp(context, Map<String, dynamic> urlRequest) async {
    late dynamic responseData;
    var url = Uri.http(
        ApiConnections.backendUrlBase, ApiConnections().urlDomains["scanProduct"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);

    if (responseData["status"] == "success") {
      /*
      sharedPreferences.setString('product_id', responseData["data"]["product_id"].toString());
      sharedPreferences.setString('category', responseData["data"]["category"].toString());
      sharedPreferences.setString('product_code', responseData["data"]["product_code"].toString());
      sharedPreferences.setString('product_quantity', responseData["data"]["product_quantity"].toString());
      sharedPreferences.setString('product_name', responseData["data"]["product_name"].toString());
      sharedPreferences.setString('countries_en', responseData["data"]["countries_en"].toString());
      sharedPreferences.setString('ingredients_text', responseData["data"]["ingredients_text"].toString());
      sharedPreferences.setString('energy', responseData["data"]["energy_100g"].toString());
      sharedPreferences.setString('fat', responseData["data"]["fat_100g"].toString());
      sharedPreferences.setString('saturated_fat', responseData["data"]["saturated_fat_100g"].toString());
      sharedPreferences.setString('trans_fat', responseData["data"]["trans_fat_100g"].toString());
      sharedPreferences.setString('cholesterol', responseData["data"]["cholesterol_100g"].toString());
      sharedPreferences.setString('carbohydrates', responseData["data"]["carbohydrates_100g"].toString());
      sharedPreferences.setString('sugars', responseData["data"]["sugars_100g"].toString());
      sharedPreferences.setString('fiber', responseData["data"]["fiber_100g"].toString());
      sharedPreferences.setString('proteins', responseData["data"]["proteins_100g"].toString());
      sharedPreferences.setString('salt', responseData["data"]["salt_100g"].toString());
      sharedPreferences.setString('sodium', responseData["data"]["sodium_100g"].toString());
      sharedPreferences.setString('calcium', responseData["data"]["calcium_100g"].toString());
      sharedPreferences.setString('iron', responseData["data"]["iron_100g"].toString());
      sharedPreferences.setString('img', responseData["data"]["img"].toString());
      */

      if (sharedPreferences.getBool("userHasCholesterol")!) {
        conditions.add("high_cholesterol");
      }
      if (sharedPreferences.getBool("userHasPressure")!) {
        conditions.add("high_blood_pressure");
      }
      if (sharedPreferences.getBool("userHasDiabetes")!) {
        conditions.add("diabetes");
      }
      if (sharedPreferences.getBool("userHasObesity")!) {
        conditions.add("obesity");
      }
      await checkRestriction(
          "${responseData["data"]["product_name"]}&${responseData["data"]["ingredients_text"]}&$conditions");

      if (!productStatues!) {
        await recommendProduct(
            "${responseData["data"]["product_code"]}&${responseData["data"]["product_name"]}&${responseData["data"]["ingredients_text"]}&$conditions");
        scanRecommended({"code": recommendedProductCode});
      }

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              productData: responseData["data"],
              productStatues: productStatues!,
            ),
          ));
    }
  }

  checkRestriction(String urlRequest) async {
    var uri = "${ApiConnections().urlDomains["restriction"]!}/$urlRequest";
    var url = Uri.http(ApiConnections.aiUrlBase, uri);
    var response = await http.get(url);
    var responseData = jsonDecode(response.body);

    productStatues = responseData["status"] == "suitable" ? true : false;

    update();
  }

  recommendProduct(String urlRequest) async {
    var uri = "${ApiConnections().urlDomains["recommendation"]!}/$urlRequest";
    var url = Uri.http(ApiConnections.aiUrlBase, uri);
    var response = await http.get(url);
    var responseData = jsonDecode(response.body);

    productStatues = responseData["status"] == "suitable" ? true : false;
    recommendedProductCode = responseData["recommendations"][0].toString();

    update();
  }

  scanRecommended(Map<String, dynamic> urlRequest) async {
    late dynamic responseData;
    var url = Uri.http(
        ApiConnections.backendUrlBase, ApiConnections().urlDomains["scanProduct"]!, urlRequest);
    var response = await http.get(url);
    responseData = jsonDecode(response.body);
    recommendedProductData.addAll(responseData["data"]);

    update();
  }
}

