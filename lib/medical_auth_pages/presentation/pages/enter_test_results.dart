/*
**********Project Name: nutrimd
**********File Name: enter_test_results
**********Created At: 16-Apr-24 10:12 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrimd/core/widgets/app_button.dart';
import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/logo_title.dart';

class EnterTestResults extends StatelessWidget {
  EnterTestResults({super.key});

  TextEditingController completeCholesterolController = TextEditingController();
  TextEditingController hdlCholesterolController = TextEditingController();
  TextEditingController ldlCholesterolController = TextEditingController();
  TextEditingController triglycerideCholesterolController = TextEditingController();
  TextEditingController diastolicPressureController = TextEditingController();
  TextEditingController systolicPressureController = TextEditingController();
  TextEditingController fastingTestSugarController = TextEditingController();
  TextEditingController a1CTestSugarController = TextEditingController();
  TextEditingController weightObesityController = TextEditingController();
  TextEditingController heightObesityController = TextEditingController();
  TextEditingController waistCircumferenceObesityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      body: SafeArea(
        // Connect the page with The tab bar controller by getx state management.
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo and Title view in the top left corner.
              const Align(
                alignment: Alignment.centerLeft,
                child: LogoAndTitle(
                  fieldAlignment: CrossAxisAlignment.start,
                  logoWidth: 100,
                ),
              ),
              spaceVertical32(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Enter required medical tests results",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: AppFonts.myH6,
                  ),
                ),
              ),
              spaceVertical32(),
              // View the pages in page view to easy switch between them and i put it in expanded widget to take the rest of the body height.
              Expanded(
                child: ListView(
                  children: [
                    /// Cholesterol Section:
                    Text(
                      "Cholesterol:",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppFonts.myH8,
                      ),
                    ),
                    AppTextField(
                      textFieldTitle: "Complete",
                      fieldController: completeCholesterolController,
                      fieldKeyboardType: TextInputType.number,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// The equation to determine the width of the field, and that by taking the width of the screen and subtract the value of the padding (16 R,16 L) from it and the value of the gap needed between the tow fields (16) and divide it on 2.
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "HDL",
                            fieldController: hdlCholesterolController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "LDL",
                            fieldController: ldlCholesterolController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    AppTextField(
                      textFieldTitle: "Triglyceride",
                      fieldController: triglycerideCholesterolController,
                      fieldKeyboardType: TextInputType.number,
                    ),

                    spaceVertical16(),
                    /// Pressure Section:
                    Text(
                      "Pressure:",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppFonts.myH8,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// The equation to determine the width of the field, and that by taking the width of the screen and subtract the value of the padding (16 R,16 L) from it and the value of the gap needed between the tow fields (16) and divide it on 2.
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "Diastolic",
                            fieldController: diastolicPressureController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "Systolic",
                            fieldController: systolicPressureController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    spaceVertical16(),
                    /// Sugar Section:
                    Text(
                      "Sugar:",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppFonts.myH8,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// The equation to determine the width of the field, and that by taking the width of the screen and subtract the value of the padding (16 R,16 L) from it and the value of the gap needed between the tow fields (16) and divide it on 2.
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "Fasting test",
                            fieldController: fastingTestSugarController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "A1C test",
                            fieldController: a1CTestSugarController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    spaceVertical16(),
                    /// Cholesterol Section:
                    Text(
                      "Obesity:",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppFonts.myH8,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// The equation to determine the width of the field, and that by taking the width of the screen and subtract the value of the padding (16 R,16 L) from it and the value of the gap needed between the tow fields (16) and divide it on 2.
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "Weight",
                            fieldController: weightObesityController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: AppTextField(
                            textFieldTitle: "Height",
                            fieldController: heightObesityController,
                            fieldKeyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    AppTextField(
                      textFieldTitle: "Waist circumference",
                      fieldController: waistCircumferenceObesityController,
                      fieldKeyboardType: TextInputType.number,
                    ),

                    spaceVertical16(),
                    Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        buttonFunction: () {},
                        buttonTitle: "Enter Data",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
