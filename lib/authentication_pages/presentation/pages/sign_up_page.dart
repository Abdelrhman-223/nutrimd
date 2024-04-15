/*
**********Project Name: nutrimd
**********File Name: sign_up_page
**********Created At: 14-Apr-24 11:16 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_radio_buttons.dart';
import 'package:nutrimd/core/utils/app_colors.dart';

import '../../../core/utils/app_fonts.dart';
import '../widgets/auth_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/password_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width - 48) / 2,
              child: AppTextField(
                textFieldTitle: "First Name",
                fieldController: firstNameController,
                fieldKeyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 48) / 2,
              child: AppTextField(
                textFieldTitle: "Second Name",
                fieldController: secondNameController,
                fieldKeyboardType: TextInputType.name,
              ),
            ),
          ],
        ),
        AppTextField(
          textFieldTitle: "Phone Number",
          fieldController: phoneNumberController,
          fieldKeyboardType: TextInputType.phone,
        ),
        AppTextField(
          textFieldTitle: "Email",
          fieldController: emailController,
          fieldKeyboardType: TextInputType.emailAddress,
        ),
        PasswordField(
          textFieldTitle: "Password",
          fieldController: passwordController,
        ),
        PasswordField(
          textFieldTitle: "Confirm Password",
          fieldController: confirmPasswordController,
        ),
        AuthRadioButtons(
          radioItemsList: const ["Male", "Female"],
          chosenItem: "Male",
        ),

        /// I will leave the system type on individual for now until we finish the app and adding it if is there a time for it.
        /*Text(
          "Choose the account type",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.fourthColor,
            fontSize: AppFonts.myP3,
          ),
        ),
        AuthRadioButtons(
          radioItemsList: const ["Individual", "Family"],
          chosenItem: "Individual",
        ),*/
        const Align(
          alignment: Alignment.center,
          child: AuthButton(buttonType: false),
        ),
      ],
    );
  }
}
