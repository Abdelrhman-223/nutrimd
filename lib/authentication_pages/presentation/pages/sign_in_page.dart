/*
**********Project Name: nutrimd
**********File Name: sign_in_page
**********Created At: 14-Apr-24 11:15 AM
**********Author: Abdelrhman Hussein
**********Description: This page to view the content of the sign in page.
*/

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_button.dart';
import 'package:nutrimd/core/widgets/app_text_field.dart';
import 'package:nutrimd/core/widgets/password_field.dart';

import 'package:http/http.dart' as http;

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        AppTextField(
          textFieldTitle: "Email",
          fieldController: emailController,
          fieldKeyboardType: TextInputType.emailAddress,
        ),
        PasswordField(
          textFieldTitle: "Password",
          fieldController: passwordController,
        ),

        // Put the button into Align widget to make it take its right width because the listview giving it the screen width.
        const Align(
          alignment: Alignment.center,
          child: AuthButton(buttonType: true),
        ),

        TextButton(
          onPressed: () async {
            print("----------------//192.168.199.119 10.0.2.2:80-----");
            String urlBase = "192.168.199.119:80",urlDomain = "nutrimdphp/authentication/signIn.php";
            Map<String, dynamic> urlRequest = {"email": "a@gmail.com", "password": "123"};
            print(urlBase + "/" + urlDomain + "/" + urlRequest.toString());
            var url = Uri.http(urlBase, urlDomain, urlRequest);
            var response = await http.post(url);
            var responseData = jsonDecode(response.body);
            print("--------------------- ${responseData["status"]}");
          },
          child: Text("Data+"),
        ),
      ],
    );
  }
}
