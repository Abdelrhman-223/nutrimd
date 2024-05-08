/*
**********Project Name: nutrimd
**********File Name: medical_results_page
**********Created At: 23-Apr-24 11:57 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/home_page.dart';
import 'package:nutrimd/medical_auth_pages/presentation/widgets/result_status.dart';
import 'package:nutrimd/medical_auth_pages/presentation/widgets/results_page_divider.dart';
import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/components/app_button.dart';
import '../../../core/widgets/logo_title.dart';
import '../manager/disease_identification.dart';
import 'enter_test_results.dart';

class MedicalResults extends StatelessWidget {
  const MedicalResults({super.key});

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
                      if (!diseaseIdentificationController.userHasSugar)
                        ResultStatus(
                            disease: "Diabetes",
                            status: diseaseIdentificationController.userHasSugar),
                      if (!diseaseIdentificationController.userHasPressure)
                        ResultStatus(
                            disease: "Pressure",
                            status: diseaseIdentificationController.userHasPressure),
                      if (!diseaseIdentificationController.userHasCholesterol)
                        ResultStatus(
                            disease: "Cholesterol",
                            status: diseaseIdentificationController.userHasCholesterol),
                      if (!diseaseIdentificationController.userHasOpicity)
                        ResultStatus(
                            disease: "Opicity",
                            status: diseaseIdentificationController.userHasOpicity),
                      spaceVertical16(),

                      /// Bad Results
                      const ResultsDivider(status: false),
                      spaceVertical8(),
                      if (diseaseIdentificationController.userHasSugar)
                        ResultStatus(
                            disease: "Diabetes",
                            status: diseaseIdentificationController.userHasSugar),
                      if (diseaseIdentificationController.userHasPressure)
                        ResultStatus(
                            disease: "Pressure",
                            status: diseaseIdentificationController.userHasPressure),
                      if (diseaseIdentificationController.userHasCholesterol)
                        ResultStatus(
                            disease: "Cholesterol",
                            status: diseaseIdentificationController.userHasCholesterol),
                      if (diseaseIdentificationController.userHasOpicity)
                        ResultStatus(
                            disease: "Opicity",
                            status: diseaseIdentificationController.userHasOpicity),

                      AppButton(
                        buttonFunction: () {
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
