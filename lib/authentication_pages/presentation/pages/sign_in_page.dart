/*
**********Project Name: nutrimd
**********File Name: sign_in_page
**********Created At: 14-Apr-24 11:15 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_button.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_text_field.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/password_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AuthTextField(textFieldTitle: "Email", fieldController: emailController,),
        PasswordField(textFieldTitle: "Password", fieldController: passwordController,),
        const AuthButton(buttonType: true),
      ],
    );
  }
}
