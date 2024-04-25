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
import 'package:get/get.dart';
import 'package:nutrimd/api_connection.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_radio_buttons.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/enter_test_results.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_tests_page.dart';

import '../../../core/widgets/app_button.dart';
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
        // This row to make the name fields in the same line.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// The equation to determine the width of the field, and that by taking the width of the screen and subtract the value of the padding (16 R,16 L) from it and the value of the gap needed between the tow fields (16) and divide it on 2.
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

        // Put the button into Align widget to make it take its right width because the listview giving it the screen width.
        Align(
          alignment: Alignment.center,
          child: AppButton(
              buttonFunction: () {
                Get.to(EnterTestResults());
                /*ApiManager().signUpFunction({
                  'first_name': firstNameController.text,
                  'last_name': secondNameController.text,
                  'phone_num': phoneNumberController.text,
                  'date_of_birth': "2001-03-22",
                  'email': emailController.text,
                  'password': passwordController.text,
                  'gendar': "0",
                  'diet_diet_id': "1",
                  'pand_pand_id': "1",
                  'family_family_id': "1",
                });*/
              },
              buttonTitle: "Sign-Up"),
        ),
      ],
    );
  }
}
