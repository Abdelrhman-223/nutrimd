/*
**********Project Name: nutrimd
**********File Name: auth_button
**********Created At: 14-Apr-24 3:08 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutrimd/core/widgets/app_button.dart';
import 'package:http/http.dart' as http;

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.buttonType});

  final bool buttonType;

  signInFunction() async {
    /*print("---------------------");
    String urlBase = "192.168.1.4",urlDomain = "api/auth/login";
    Map<String, dynamic> urlRequest = {"email": "a@gmail.com", "password": "123"};
    var url = Uri.http(urlBase, urlDomain, urlRequest);
    var response = await http.post(url);
    var responseData = jsonDecode(response.body);
    print("--------------------- ${responseData["status"]}");*/
  }

  signUpFunction() {}

  @override
  Widget build(BuildContext context) {
    return (buttonType)
        ? AppButton(buttonFunction: signInFunction, buttonTitle: "Sign-In")
        : AppButton(buttonFunction: signUpFunction, buttonTitle: "Sign-Up");
  }
}
