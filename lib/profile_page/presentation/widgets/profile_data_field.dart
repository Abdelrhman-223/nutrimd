/*
**********Project Name: nutrimd
**********File Name: profile_data_field
**********Created At: 06-May-24 11:09 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/core/utils/app_colors.dart';

class ProfileDataField extends StatelessWidget {
  const ProfileDataField({super.key, required this.fieldTitle, required this.fieldValue});

  final String fieldTitle, fieldValue;
  final double fieldHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: fieldHeight,
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 2.5 + 16, 0, 16, 0),
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.circular(fieldHeight / 2),
                border: GradientBoxBorder(
                  width: 1,
                  gradient: AppColors.hRtLLinearDarkGrid,
                ),
              ),
              child: Text(
                fieldValue,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondColor,
                ),
              ),
            ),
          ),
          Container(
            height: fieldHeight,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                color: AppColors.mainColor, borderRadius: BorderRadius.circular(fieldHeight / 2)),
            child: Text(
              "$fieldTitle:",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.fifthColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
