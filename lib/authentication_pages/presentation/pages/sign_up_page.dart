/*
**********Project Name: nutrimd
**********File Name: sign_up_page
**********Created At: 14-Apr-24 11:16 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_radio_buttons.dart';
import 'package:nutrimd/authentication_pages/data/data_sources/auth_api.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';
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

  double sliderValue = 0.05;
  double activityLevel = 1.2;
  String activityLevelTitle = "Sedentary";

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

            spaceVertical32(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Activity Level",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.mainColor,
                  ),
                ),
                spaceVertical8(),
                Text(
                  activityLevelTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.secondColor,
                  ),
                ),
                spaceVertical8(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: InteractiveSlider(
                    min: 0,
                    max: 1,
                    initialProgress: sliderValue,
                    unfocusedMargin: EdgeInsets.zero,
                    foregroundColor: AppColors.mainColor,
                    padding: EdgeInsets.zero,
                    backgroundColor: AppColors.thirdColor,
                    transitionCurvePeriod: 0.25,
                    onChanged: (value) {
                      setState(() {
                        if (value >= 0 && value <= 0.125) {
                          sliderValue = 0.05;
                          activityLevel = 1.2;
                          activityLevelTitle = "Sedentary";
                        } else if (value >= 0.125 && value <= 0.375) {
                          sliderValue = 0.25;
                          activityLevel = 1.375;
                          activityLevelTitle = "Lightly active";
                        } else if (value >= 0.375 && value <= 0.625) {
                          sliderValue = 0.5;
                          activityLevel = 1.55;
                          activityLevelTitle = "Moderately active";
                        } else if (value >= 0.625 && value <= 0.875) {
                          sliderValue = 0.75;
                          activityLevel = 1.725;
                          activityLevelTitle = "Active";
                        } else if (value >= 0.875 && value <= 1) {
                          sliderValue = 1;
                          activityLevel = 1.9;
                          activityLevelTitle = "Very active";
                        }
                      });
                    },
                  ),
                ),
                spaceVertical8(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: (sliderValue == 0.05) ? 1 : 0.25,
                        child: SvgPicture.asset(
                          AppIcons.sleepingEmoji,
                        ),
                      ),
                      Opacity(
                        opacity: (sliderValue == 0.25) ? 1 : 0.25,
                        child: SvgPicture.asset(
                          AppIcons.yawnEmoji,
                        ),
                      ),
                      Opacity(
                        opacity: (sliderValue == 0.5) ? 1 : 0.25,
                        child: SvgPicture.asset(
                          AppIcons.smilingEmoji,
                        ),
                      ),
                      Opacity(
                        opacity: (sliderValue == 0.75) ? 1 : 0.25,
                        child: SvgPicture.asset(
                          AppIcons.sadEmoji,
                        ),
                      ),
                      Opacity(
                        opacity: (sliderValue == 1) ? 1 : 0.25,
                        child: SvgPicture.asset(
                          AppIcons.steamingEmoji,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            spaceVertical32(),

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
                            apiController.signUpFunction(context, {
                              'first_name': firstNameController.text,
                              'last_name': secondNameController.text,
                              'phone_num': phoneNumberController.text,
                              'date_of_birth': authDataController.birthDate,
                              'email': emailController.text,
                              'password': passwordController.text,
                              'activity_level': activityLevel.toString(),
                              'gender': (authDataController.radioButtonValues["gender"] == "Male")
                                  ? "0"
                                  : "1",
                            });
                            sharedPreferences.setBool("logging", true);
                            sharedPreferences.setString('firstName', firstNameController.text);
                            sharedPreferences.setString('lastName', secondNameController.text);
                            sharedPreferences.setString('phoneNum', phoneNumberController.text);
                            sharedPreferences.setString('birthDate', authDataController.birthDate);
                            sharedPreferences.setString('email', emailController.text);
                            sharedPreferences.setString('password', passwordController.text);
                            sharedPreferences.setString(
                                'gender', authDataController.radioButtonValues["gender"]!);

                            sharedPreferences.setDouble("activityLevel", activityLevel);
                            sharedPreferences.setString("activityLevelTitle", activityLevelTitle);
                          }
                        },
                        buttonTitle: "Sign-Up",
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
