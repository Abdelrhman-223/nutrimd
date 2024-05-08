/*
**********Project Name: nutrimd
**********File Name: profile_page_separator
**********Created At: 06-May-24 10:33 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';
import 'package:nutrimd/profile_page/presentation/manager/profile_controller.dart';

class ProfilePageSeparator extends StatelessWidget {
  ProfilePageSeparator({super.key, required this.fieldTitle});

  final String fieldTitle;

  double fieldHeight = 40;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profileController) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: fieldHeight,
            width: profileController.activatedField[fieldTitle]!
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.fromLTRB(16, 0, 2, 0),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              gradient: AppColors.hLtRLinearDarkGrid,
              borderRadius: BorderRadius.circular(fieldHeight / 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fieldTitle,
                  style: TextStyle(
                    color: AppColors.fifthColor,
                    fontSize: 14,
                  ),
                ),
                profileController.activatedField[fieldTitle]!
                    ? GestureDetector(
                        onTap: () {
                          profileController.notActivePage(fieldTitle);
                        },
                        child: (fieldTitle != "Personal Data")?SvgPicture.asset(
                          height: fieldHeight - 4,
                          AppIcons.arrowCircleLeft,
                        ):const Text(""),
                      )
                    : GestureDetector(
                        onTap: () {
                          profileController.activePage(fieldTitle);
                        },
                        child: SvgPicture.asset(
                          height: fieldHeight - 4,
                          AppIcons.arrowCircleRight,
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
