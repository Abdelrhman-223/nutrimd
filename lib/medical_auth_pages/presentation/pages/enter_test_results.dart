/*
**********Project Name: nutrimd
**********File Name: enter_test_results
**********Created At: 16-Apr-24 10:12 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/widgets/app_button.dart';
import 'package:nutrimd/medical_auth_pages/presentation/manager/disease_identification.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_results_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/widgets/small_text_field_row.dart';
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
  TextEditingController oralTestSugarController = TextEditingController();
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
                    SmallTextFieldRow(
                      firstFieldTitle: "HDL",
                      secondFieldTitle: "LDL",
                      firstFieldController: hdlCholesterolController,
                      secondFieldController: ldlCholesterolController,
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
                    SmallTextFieldRow(
                      firstFieldTitle: "Diastolic",
                      secondFieldTitle: "Systolic",
                      firstFieldController: diastolicPressureController,
                      secondFieldController: systolicPressureController,
                    ),

                    spaceVertical16(),

                    /// Diabetes Section:
                    Text(
                      "Diabetes:",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppFonts.myH8,
                      ),
                    ),
                    SmallTextFieldRow(
                      firstFieldTitle: "Fasting test",
                      secondFieldTitle: "Oral test",
                      firstFieldController: fastingTestSugarController,
                      secondFieldController: oralTestSugarController,
                    ),
                    AppTextField(
                      textFieldTitle: "A1C test",
                      fieldController: a1CTestSugarController,
                      fieldKeyboardType: TextInputType.number,
                    ),
                    spaceVertical16(),

                    /// Obesity Section:
                    Text(
                      "Obesity:",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: AppFonts.myH8,
                      ),
                    ),
                    SmallTextFieldRow(
                      firstFieldTitle: "Weight",
                      secondFieldTitle: "Height",
                      firstFieldController: weightObesityController,
                      secondFieldController: heightObesityController,
                    ),
                    AppTextField(
                      textFieldTitle: "Waist circumference",
                      fieldController: waistCircumferenceObesityController,
                      fieldKeyboardType: TextInputType.number,
                    ),

                    spaceVertical16(),
                    GetBuilder<DiseaseIdentification>(
                        init: DiseaseIdentification(),
                        builder: (diseaseIdentificationController) {
                          return Align(
                            alignment: Alignment.center,
                            child: AppButton(
                              buttonFunction: () {
                                Map<String, double> testsResults = {
                                  "completeCholesterol":
                                      double.parse(completeCholesterolController.text),
                                  "hdlCholesterol": double.parse(hdlCholesterolController.text),
                                  "ldlCholesterol": double.parse(ldlCholesterolController.text),
                                  "triglycerideCholesterol":
                                      double.parse(triglycerideCholesterolController.text),
                                  "diastolicPressure": double.parse(diastolicPressureController.text),
                                  "systolicPressure": double.parse(systolicPressureController.text),
                                  "fastingTestSugar": double.parse(fastingTestSugarController.text),
                                  "oralTestSugar": double.parse(oralTestSugarController.text),
                                  "a1CTestSugar": double.parse(a1CTestSugarController.text),
                                  "weightObesity": double.parse(weightObesityController.text),
                                  "heightObesity": double.parse(heightObesityController.text),
                                  "waistCircumferenceObesity":
                                      double.parse(waistCircumferenceObesityController.text),
                                };

                                print(testsResults);
                                diseaseIdentificationController.addResults(testsResults);
                                Get.to(const MedicalResults());
                              },
                              buttonTitle: "Enter Data",
                            ),
                          );
                        })
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
