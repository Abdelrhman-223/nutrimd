/*
**********Project Name: nutrimd
**********File Name: enter_test_results
**********Created At: 16-Apr-24 10:12 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/components/app_button.dart';
import 'package:nutrimd/core/widgets/page_separator.dart';
import 'package:nutrimd/main.dart';
import 'package:nutrimd/medical_auth_pages/presentation/manager/disease_identification.dart';
import 'package:nutrimd/medical_auth_pages/presentation/pages/medical_results_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/widgets/small_text_field_row.dart';
import '../../../authentication_pages/presentation/manager/auth_data_controller.dart';
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
  TextEditingController fatsObesityController = TextEditingController();
  TextEditingController waterObesityController = TextEditingController();

  DiseaseIdentification diseaseIdentificationController = Get.put(DiseaseIdentification());
  AuthDataController authDataController = Get.put(AuthDataController());

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
                  "Enter required tests results",
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
                    const PageSeparator(separatorTitle: "Physical Data"),
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
                    SmallTextFieldRow(
                      firstFieldTitle: "Fats",
                      secondFieldTitle: "Water",
                      firstFieldController: fatsObesityController,
                      secondFieldController: waterObesityController,
                    ),

                    spaceVertical16(),

                    const PageSeparator(separatorTitle: "Medical Data"),
                    spaceVertical16(),

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

                    Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        buttonFunction: () {
                          Map<String, double> testsResults = {
                            "completeCholesterol": double.parse(completeCholesterolController.text),
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
                          };

                          print(testsResults);
                          diseaseIdentificationController.addResults(
                              testsResults, authDataController.radioButtonValues["gender"]!);

                          sharedPreferences.setDouble("completeCholesterol",
                              double.parse(completeCholesterolController.text));
                          sharedPreferences.setDouble(
                              "hdlCholesterol", double.parse(hdlCholesterolController.text));
                          sharedPreferences.setDouble(
                              "ldlCholesterol", double.parse(ldlCholesterolController.text));
                          sharedPreferences.setDouble("triglycerideCholesterol",
                              double.parse(triglycerideCholesterolController.text));
                          sharedPreferences.setDouble(
                              "diastolicPressure", double.parse(diastolicPressureController.text));
                          sharedPreferences.setDouble(
                              "systolicPressure", double.parse(systolicPressureController.text));
                          sharedPreferences.setDouble(
                              "fastingTestSugar", double.parse(fastingTestSugarController.text));
                          sharedPreferences.setDouble(
                              "oralTestSugar", double.parse(oralTestSugarController.text));
                          sharedPreferences.setDouble(
                              "a1CTestSugar", double.parse(a1CTestSugarController.text));
                          sharedPreferences.setDouble(
                              "weightObesity", double.parse(weightObesityController.text));
                          sharedPreferences.setDouble(
                              "heightObesity", double.parse(heightObesityController.text));
                          sharedPreferences.setDouble(
                              "fatsObesity", double.parse(fatsObesityController.text));
                          sharedPreferences.setDouble(
                              "waterObesity", double.parse(waterObesityController.text));
                          Get.to(const MedicalResults());
                        },
                        buttonTitle: "Enter Data",
                      ),
                    ),
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
