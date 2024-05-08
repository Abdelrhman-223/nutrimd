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
                  "Abdelrhman",
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
                    spaceVertical8(),
                  ],
                ),
              ProfilePageSeparator(fieldTitle: "Physical Data"),
              if (profileController.activatedField["Physical Data"]!)
                Column(
                  children: [
                    ProfileDataField(
                        fieldTitle: "Weight",
                        fieldValue: sharedPreferences.getDouble('weightObesity')!.toString()),
                    ProfileDataField(
                        fieldTitle: "Height",
                        fieldValue: sharedPreferences.getDouble('heightObesity')!.toString()),
                    ProfileDataField(
                        fieldTitle: "Fats", fieldValue: sharedPreferences.getDouble('fatsObesity')!.toString()),
                    ProfileDataField(
                        fieldTitle: "Water", fieldValue: sharedPreferences.getDouble('waterObesity')!.toString()),
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
                        fieldValue: sharedPreferences.getDouble('completeCholesterol')!.toString()),
                    ProfileDataField(
                        fieldTitle: "HDL",
                        fieldValue: sharedPreferences.getDouble('hdlCholesterol')!.toString()),
                    ProfileDataField(
                        fieldTitle: "LDL", fieldValue: sharedPreferences.getDouble('ldlCholesterol')!.toString()),
                    ProfileDataField(
                        fieldTitle: "Triglyceride",
                        fieldValue: sharedPreferences.getDouble('triglycerideCholesterol')!.toString()),
                    const PageSeparator(separatorTitle: "Pressure Data"),
                    ProfileDataField(
                        fieldTitle: "Diastolic",
                        fieldValue: sharedPreferences.getDouble('diastolicPressure')!.toString()),
                    ProfileDataField(
                        fieldTitle: "Systolic", fieldValue: sharedPreferences.getDouble('systolicPressure')!.toString()),
                    const PageSeparator(separatorTitle: "Diabetes Data"),
                    ProfileDataField(
                        fieldTitle: "Fasting test",
                        fieldValue: sharedPreferences.getDouble('fastingTestSugar')!.toString()),
                    ProfileDataField(
                        fieldTitle: "Oral test",
                        fieldValue: sharedPreferences.getDouble('oralTestSugar')!.toString()),
                    ProfileDataField(
                        fieldTitle: "A1C test", fieldValue: sharedPreferences.getDouble('a1CTestSugar')!.toString()),
                    spaceVertical8(),
                  ],
                ),
            ],
          );
        });
  }
}
