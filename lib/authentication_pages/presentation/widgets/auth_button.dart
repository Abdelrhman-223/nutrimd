/*
**********Project Name: nutrimd
**********File Name: auth_button
**********Created At: 14-Apr-24 3:08 PM
**********Author: Abdelrhman Hussein
**********Description: This code to create the the button of authentication to manage the function according to button type if it sign in or up.
*/

import 'package:flutter/material.dart';
import 'package:nutrimd/core/widgets/app_button.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.buttonType});

  final bool buttonType;

  signInFunction() async {
    print("object");
    // this code for testing the sign in api but it dose not work.
    /*print("---------------------");
      String urlBase = "192.168.1.4",urlDomain = "app/Http/Controllers/api/authentication/signin";
      Map<String, dynamic> urlRequest = {"email": "a@gmail.com", "password": "123"};
      print(urlBase + "/" + urlDomain + "/" + urlRequest.toString());
      var url = Uri.http(urlBase, urlDomain, urlRequest);
      var response = await http.post(url);
      var responseData = jsonDecode(response.body);
      print("--------------------- ${responseData["status"]}");*/
  }

  signUpFunction() {}

  @override
  Widget build(BuildContext context) {
    // It check the button type and send the right function while calling the button.
    return (buttonType)
        ? AppButton(buttonFunction: signInFunction, buttonTitle: "Sign-In")
        : AppButton(buttonFunction: signUpFunction, buttonTitle: "Sign-Up");
  }
}
