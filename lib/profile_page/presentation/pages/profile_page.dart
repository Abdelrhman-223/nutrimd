/*
**********Project Name: nutrimd
**********File Name: profile_page
**********Created At: 06-May-24 10:09 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_images.dart';
import 'package:nutrimd/core/widgets/page_separator.dart';
import 'package:nutrimd/profile_page/presentation/manager/profile_controller.dart';
import 'package:nutrimd/profile_page/presentation/widgets/profile_data_field.dart';
import 'package:nutrimd/profile_page/presentation/widgets/profile_page_separator.dart';

import '../../../main.dart';
import '../../../medical_auth_pages/presentation/widgets/result_status.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final double userImageSize = 150;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: userImageSize,
                  height: userImageSize,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.fifthColor,
                    borderRadius: BorderRadius.circular(userImageSize / 2),
                    image: DecorationImage(
                      image: AssetImage(ImagePaths.user),
                    ),
                    border: GradientBoxBorder(gradient: AppColors.vUtDLinearDarkGrid, width: 10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${sharedPreferences.getString('firstName')!} ${sharedPreferences.getString('lastName')!}",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20,
                  ),
                ),
              ),
              spaceVertical16(),
              ProfilePageSeparator(fieldTitle: "Personal Data"),
              if (profileController.activatedField["Personal Data"]!)
                Column(
                  children: [
                    ProfileDataField(
                        fieldTitle: "First Name",
                        fieldValue: sharedPreferences.getString('firstName')!),
                    ProfileDataField(
                        fieldTitle: "Last Name",
                        fieldValue: sharedPreferences.getString('lastName')!),
                    ProfileDataField(
                        fieldTitle: "Email", fieldValue: sharedPreferences.getString('email')!),
                    ProfileDataField(
                        fieldTitle: "Birth Date",
                        fieldValue: sharedPreferences.getString('birthDate')!),
                    ProfileDataField(
                        fieldTitle: "Phone NO",
                        fieldValue: sharedPreferences.getString('phoneNum')!),
                    ProfileDataField(
                        fieldTitle: "Gender", fieldValue: sharedPreferences.getString('gender')!),
                    ProfileDataField(
                        fieldTitle: "Activity Level",
                        fieldValue:
                            '${sharedPreferences.getDouble('activityLevel')} "${sharedPreferences.getString('activityLevelTitle')!}"'),
                    spaceVertical8(),
                  ],
                ),
              ProfilePageSeparator(fieldTitle: "Physical Data"),
              if (profileController.activatedField["Physical Data"]!)
                Column(
                  children: [
                    ProfileDataField(
                        fieldTitle: "Weight",
                        fieldValue: "${sharedPreferences.getDouble('weightObesity')!} Kg"),
                    ProfileDataField(
                        fieldTitle: "Height",
                        fieldValue: "${sharedPreferences.getDouble('heightObesity')!} m"),
                    ProfileDataField(
                        fieldTitle: "BMI",
                        fieldValue:
                            "${sharedPreferences.getDouble('bmi').toString().substring(0, 6)}  (${sharedPreferences.getString('obesity')!})"),
                    ProfileDataField(
                        fieldTitle: "Fats",
                        fieldValue: "${sharedPreferences.getDouble('fatsObesity')!} %"),
                    ProfileDataField(
                        fieldTitle: "Water",
                        fieldValue: "${sharedPreferences.getDouble('waterObesity')!} %"),
                    spaceVertical8(),
                  ],
                ),
              ProfilePageSeparator(fieldTitle: "Medical Data"),
              if (profileController.activatedField["Medical Data"]!)
                Column(
                  children: [
                    const PageSeparator(separatorTitle: "Cholesterol Data"),
                    ProfileDataField(
                        fieldTitle: "Complete",
                        fieldValue:
                            "${sharedPreferences.getDouble('completeCholesterol')!} mg/dL  (${sharedPreferences.getString('complete_cholesterol')!})"),
                    ProfileDataField(
                        fieldTitle: "HDL",
                        fieldValue:
                            "${sharedPreferences.getDouble('hdlCholesterol')!} mg/dL  (${sharedPreferences.getString('hdl_cholesterol')!})"),
                    ProfileDataField(
                        fieldTitle: "LDL",
                        fieldValue:
                            "${sharedPreferences.getDouble('ldlCholesterol')!} mg/dL  (${sharedPreferences.getString('ldl_cholesterol')!})"),
                    ProfileDataField(
                        fieldTitle: "Triglyceride",
                        fieldValue:
                            "${sharedPreferences.getDouble('triglycerideCholesterol')!} mg/dL  (${sharedPreferences.getString('triglyceride_cholesterol')!})"),
                    const PageSeparator(separatorTitle: "Diabetes Data"),
                    ProfileDataField(
                        fieldTitle: "Diastolic",
                        fieldValue:
                            "${sharedPreferences.getDouble('diastolicPressure')!} mm Hg  (${sharedPreferences.getString('pressure')!})"),
                    ProfileDataField(
                        fieldTitle: "Systolic",
                        fieldValue:
                            "${sharedPreferences.getDouble('systolicPressure')!} mm Hg  (${sharedPreferences.getString('pressure')!})"),
                    const PageSeparator(separatorTitle: "Pressure Data"),
                    ProfileDataField(
                        fieldTitle: "Fasting test",
                        fieldValue:
                            "${sharedPreferences.getDouble('fastingTestSugar')!} mg/dL  (${sharedPreferences.getString('fasting_test_diabetes')!})"),
                    ProfileDataField(
                        fieldTitle: "Oral test",
                        fieldValue:
                            "${sharedPreferences.getDouble('oralTestSugar')!} mg/dL  (${sharedPreferences.getString('oral_test_diabetes')!})"),
                    ProfileDataField(
                        fieldTitle: "A1C test",
                        fieldValue:
                            "${sharedPreferences.getDouble('a1CTestSugar')!} %  (${sharedPreferences.getString('a1c_test_diabetes')!})"),
                    spaceVertical8(),
                  ],
                ),
              ProfilePageSeparator(fieldTitle: "Analysis Results"),
              if (profileController.activatedField["Analysis Results"]!)
                Column(
                  children: [
                    ResultStatus(
                      disease: "Diabetes",
                      status: sharedPreferences.getBool("userHasDiabetes")!,
                    ),
                    ResultStatus(
                      disease: "Pressure",
                      status: sharedPreferences.getBool("userHasPressure")!,
                    ),
                    ResultStatus(
                      disease: "Cholesterol",
                      status: sharedPreferences.getBool("userHasCholesterol")!,
                    ),
                    ResultStatus(
                      disease: "Obesity",
                      status: sharedPreferences.getBool("userHasObesity")!,
                    ),
                  ],
                ),
            ],
          );
        });
  }
}
