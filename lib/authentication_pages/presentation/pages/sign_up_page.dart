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
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/main.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/enter_test_results.dart';
import '../../../core/components/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/password_field.dart';
import '../../../medical_auth_pages/presentation/manager/disease_identification.dart';
import '../manager/auth_data_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  DiseaseIdentification diseaseIdentificationController = Get.put(DiseaseIdentification());
  AuthDataController authDataController = Get.put(AuthDataController());

  DateTime? birthDate;
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
        GetBuilder<AuthDataController>(
            init: AuthDataController(),
            builder: (dataController) {
              return AppButton(
                buttonTitle:  dataController.birthDate.isNotEmpty ? dataController.birthDate : "Birth Date",
                buttonFunction: () async {
                  birthDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1940),
                    lastDate: DateTime.now(),
                    builder: (context, child) => DatePickerTheme(
                      data: DatePickerThemeData(
                        backgroundColor: AppColors.fifthColor,
                        todayForegroundColor: MaterialStateProperty.all(AppColors.fifthColor),
                        todayBackgroundColor: MaterialStateProperty.all(AppColors.fourthColor),
                        inputDecorationTheme: InputDecorationTheme(
                          fillColor: AppColors.mainColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                          ),
                          outlineBorder: BorderSide(color: AppColors.mainColor),
                        ),
                        weekdayStyle: TextStyle(
                          color: AppColors.secondColor,
                        ),
                        //dayBackgroundColor: MaterialStateProperty.all(AppColors.secondColor),
                        headerBackgroundColor: AppColors.mainColor,
                        headerForegroundColor: AppColors.fifthColor,
                      ),
                      child: DatePickerDialog(
                        firstDate: DateTime(1940),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                      ),
                    ),
                  );
                  dataController.getBirthDate(birthDate.toString().substring(0, 10));
                },
              );
            }),
        AuthRadioButtons(
          radioItemsList: const ["Male", "Female"],
          buttonId: "gender",
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
          buttonId: "familyType",
          chosenItem: "Individual",
        ),*/

        // Put the button into Align widget to make it take its right width because the listview giving it the screen width.
        GetBuilder<ApiManager>(
            init: ApiManager(),
            builder: (apiController) {
              return Align(
                alignment: Alignment.center,
                child: AppButton(
                    buttonFunction: () {
                      /*ApiManager().signUpFunction({
                        'first_name': firstNameController.text,
                        'last_name': secondNameController.text,
                        'phone_num': phoneNumberController.text,
                        'date_of_birth': DateTime.now().toString().substring(0, 10),
                        'email': emailController.text,
                        'password': passwordController.text,
                        'gender': authDataController.radioButtonValues["gender"],
                      });*/

                      sharedPreferences.setBool("logging", true);
                      sharedPreferences.setString('firstName', firstNameController.text);
                      sharedPreferences.setString('lastName', secondNameController.text);
                      sharedPreferences.setString('phoneNum', phoneNumberController.text);
                      sharedPreferences.setString(
                          'birthDate', birthDate.toString().substring(0, 10));
                      sharedPreferences.setString('email', emailController.text);
                      sharedPreferences.setString('password', passwordController.text);
                      sharedPreferences.setString(
                          'gender', authDataController.radioButtonValues["gender"]!);

                      if (firstNameController.text != "" &&
                          secondNameController.text != "" &&
                          phoneNumberController.text != "" &&
                          emailController.text != "" &&
                          passwordController.text != "") {
                        Get.to(EnterTestResults());
                      }
                    },
                    buttonTitle: "Sign-Up"),
              );
            }),
      ],
    );
  }
}
