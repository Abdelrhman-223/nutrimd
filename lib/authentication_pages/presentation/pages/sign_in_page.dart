/*
**********Project Name: nutrimd
**********File Name: sign_in_page
**********Created At: 14-Apr-24 11:15 AM
**********Author: Abdelrhman Hussein
**********Description: This page to view the content of the sign in page.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/widgets/app_text_field.dart';
import 'package:nutrimd/core/widgets/password_field.dart';

import '../../../api_connection.dart';
import '../../../core/components/app_button.dart';

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
        GetBuilder<ApiManager>(
            init: ApiManager(),
            builder: (apiController) {
              return Align(
                alignment: Alignment.center,
                child: AppButton(
                    buttonFunction: () {
                      apiController.signInFunction(
                        {
                          "email": emailController.text,
                          "password": passwordController.text,
                        },
                      );
                    },
                    buttonTitle: "Sign-In"),
              );
            }),
      ],
    );
  }
}
