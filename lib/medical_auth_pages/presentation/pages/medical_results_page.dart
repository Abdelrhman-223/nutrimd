/*
**********Project Name: nutrimd
**********File Name: medical_results_page
**********Created At: 23-Apr-24 11:57 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/home_page/presentation/pages/home_page.dart';
import 'package:nutrimd/main.dart';
import 'package:nutrimd/medical_auth_pages/presentation/widgets/result_status.dart';
import 'package:nutrimd/medical_auth_pages/presentation/widgets/results_page_divider.dart';
import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/components/app_button.dart';
import '../../../core/widgets/logo_title.dart';
import '../../../diet_protocol/presentation/manager/diet_protocol_controller.dart';
import '../../data/data_sources/medical_api.dart';
import '../manager/disease_identification.dart';

class MedicalResults extends StatelessWidget {
  MedicalResults({super.key});

  DietProtocolController dietProtocolController = Get.put(DietProtocolController());
  MedicalApiManager medicalApiManager = Get.put(MedicalApiManager());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiseaseIdentification>(
        init: DiseaseIdentification(),
        builder: (diseaseIdentificationController) {
          return Scaffold(
            backgroundColor: AppColors.fifthColor,
            body: SafeArea(
              // Connect the page with The tab bar controller by getx state management.
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo and Title view in the top left corner.
                      const Align(
                        alignment: Alignment.center,
                        child: LogoAndTitle(
                          fieldAlignment: CrossAxisAlignment.center,
                          logoWidth: 150,
                        ),
                      ),
                      spaceVertical32(),
                      Text(
                        "Medical Tests Results",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "FOR YOU",
                        style: TextStyle(
                          color: AppColors.secondColor,
                          fontSize: 22,
                        ),
                      ),
                      spaceVertical16(),

                      /// Good Results
                      const ResultsDivider(status: true),
                      spaceVertical8(),
                      if (!diseaseIdentificationController.userHasDiabetes)
                        ResultStatus(
                            disease: "Diabetes",
                            status: diseaseIdentificationController.userHasDiabetes),
                      if (!diseaseIdentificationController.userHasPressure)
                        ResultStatus(
                            disease: "Pressure",
                            status: diseaseIdentificationController.userHasPressure),
                      if (!diseaseIdentificationController.userHasCholesterol)
                        ResultStatus(
                            disease: "Cholesterol",
                            status: diseaseIdentificationController.userHasCholesterol),
                      if (!diseaseIdentificationController.userHasObesity)
                        ResultStatus(
                            disease: "Obesity",
                            status: diseaseIdentificationController.userHasObesity),
                      spaceVertical16(),

                      /// Bad Results
                      const ResultsDivider(status: false),
                      spaceVertical8(),
                      if (diseaseIdentificationController.userHasDiabetes)
                        ResultStatus(
                            disease: "Diabetes",
                            status: diseaseIdentificationController.userHasDiabetes),
                      if (diseaseIdentificationController.userHasPressure)
                        ResultStatus(
                            disease: "Pressure",
                            status: diseaseIdentificationController.userHasPressure),
                      if (diseaseIdentificationController.userHasCholesterol)
                        ResultStatus(
                            disease: "Cholesterol",
                            status: diseaseIdentificationController.userHasCholesterol),
                      if (diseaseIdentificationController.userHasObesity)
                        ResultStatus(
                            disease: "Obesity",
                            status: diseaseIdentificationController.userHasObesity),
                      AppButton(
                        buttonFunction: () {
                          dietProtocolController.calculateBMR();
                          medicalApiManager.addUserDiseases({
                            "diabetes": diseaseIdentificationController.userHasDiabetes ? "1" : "0",
                            "pressure": diseaseIdentificationController.userHasPressure ? "1" : "0",
                            "obesity":
                                diseaseIdentificationController.userHasCholesterol ? "1" : "0",
                            "cholesterol":
                                diseaseIdentificationController.userHasObesity ? "1" : "0",
                            "user_id": sharedPreferences.getString("userId")!,
                          });
                          medicalApiManager.addUserDiet({
                            "min_carb_ratio": dietProtocolController.carpMinValue.toString(),
                            "min_fats_ratio": dietProtocolController.fatsMinValue.toString(),
                            "min_protein_ratio": dietProtocolController.proteinMinValue.toString(),
                            "max_carb_ratio": dietProtocolController.carpMaxValue.toString(),
                            "max_fats_ratio": dietProtocolController.fatsMaxValue.toString(),
                            "max_protein_ratio": dietProtocolController.proteinMaxValue.toString(),
                            "bmr": dietProtocolController.bmrWithActivityLevel.toString(),
                            "user_id": sharedPreferences.getString("userId")!,
                          });
                          Get.to(const MyHomePage());
                        },
                        buttonTitle: "Continue",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
