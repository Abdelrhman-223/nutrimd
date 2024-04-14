/*
**********Project Name: nutrimd
**********File Name: auth_button
**********Created At: 14-Apr-24 3:08 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:nutrimd/core/widgets/app_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.buttonType});

  final bool buttonType;

  signInFunction() {}

  signUpFunction() {}

  @override
  Widget build(BuildContext context) {
    return (buttonType)
        ? AppButton(buttonFunction: signInFunction, buttonTitle: "Sign-In")
        : AppButton(buttonFunction: signUpFunction, buttonTitle: "Sign-Up");
  }
}
