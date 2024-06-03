/*
**********Project Name: nutrimd
**********File Name: sign_up_page
**********Created At: 14-Apr-24 11:16 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_radio_buttons.dart';
import 'package:nutrimd/authentication_pages/data/data_sources/auth_api.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/widgets/small_text_field_row.dart';
import 'package:nutrimd/main.dart';
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

  String alertMessage = "", confirmAlertMessage = "", phoneAlertMessage = "";

  bool dataValid = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        fieldsValidation() {
          setState(() {
            if (firstNameController.text != "" &&
                secondNameController.text != "" &&
                phoneNumberController.text != "" &&
                emailController.text != "" &&
                passwordController.text != "" &&
                confirmPasswordController.text != "") {
              dataValid = true;
              alertMessage = "";
            } else {
              dataValid = false;
              alertMessage = "You should fill this fields.";
            }

            if (passwordController.text == confirmPasswordController.text) {
              confirmAlertMessage = "";
              dataValid = true;
            } else {
              dataValid = false;
              confirmAlertMessage = "Passwords are not matches.";
            }

            if (phoneNumberController.text.length < 11) {
              dataValid = false;
              phoneAlertMessage = "Phone number is less then 11 numbers.";
            } else if (phoneNumberController.text.length > 11) {
              dataValid = false;
              phoneAlertMessage = "Phone number is more then 11 numbers.";
            } else {
              phoneAlertMessage = "";
              dataValid = true;
            }
          });
        }

        return ListView(
          shrinkWrap: true,
          children: [
            // This row to make the name fields in the same line.
            SmallTextFieldRow(
              firstFieldTitle: "First Name",
              secondFieldTitle: "Second Name",
              firstFieldController: firstNameController,
              secondFieldController: secondNameController,
              fieldKeyboardType: TextInputType.name,
            ),
            /*Row(
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
            ),*/
            AppTextField(
              textFieldTitle: "Phone Number",
              fieldController: phoneNumberController,
              fieldKeyboardType: TextInputType.phone,
            ),
            if (phoneAlertMessage != "")
              Text(
                phoneAlertMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.redColor,
                ),
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
            if (confirmAlertMessage != "")
              Text(
                confirmAlertMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.redColor,
                ),
              ),
            GetBuilder<AuthDataController>(
                init: AuthDataController(),
                builder: (dataController) {
                  return AppButton(
                    buttonTitle: dataController.birthDate.isNotEmpty
                        ? dataController.birthDate
                        : "Birth Date",
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
            if (alertMessage != "")
              Text(
                alertMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.redColor,
                ),
              ),
            // Put the button into Align widget to make it take its right width because the listview giving it the screen width.
            GetBuilder<AuthApiManager>(
              init: AuthApiManager(),
              builder: (apiController) {
                return GetBuilder<AuthDataController>(
                    init: AuthDataController(),
                    builder: (authDataController) {
                      return Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          buttonFunction: () {
                            fieldsValidation();
                            if (dataValid) {
                              apiController.signUpFunction({
                                'first_name': firstNameController.text,
                                'last_name': secondNameController.text,
                                'phone_num': phoneNumberController.text,
                                'date_of_birth': authDataController.birthDate,
                                'email': emailController.text,
                                'password': passwordController.text,
                                'gender': (authDataController.radioButtonValues["gender"] == "Male")
                                    ? "0"
                                    : "1",
                              });
                              sharedPreferences.setBool("logging", true);
                              sharedPreferences.setString('firstName', firstNameController.text);
                              sharedPreferences.setString('lastName', secondNameController.text);
                              sharedPreferences.setString('phoneNum', phoneNumberController.text);
                              sharedPreferences.setString(
                                  'birthDate', authDataController.birthDate);
                              sharedPreferences.setString('email', emailController.text);
                              sharedPreferences.setString('password', passwordController.text);
                              sharedPreferences.setString(
                                  'gender', authDataController.radioButtonValues["gender"]!);
                            }
                          },
                          buttonTitle: "Sign-Up",
                        ),
                      );
                    });
              },
            ),
          ],
        );
      },
    );
  }
}
