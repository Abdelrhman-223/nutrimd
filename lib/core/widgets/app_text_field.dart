/*
**********Project Name: nutrimd
**********File Name: auth_text_field
**********Created At: 14-Apr-24 11:21 AM
**********Author: Abdelrhman Hussein
**********Description: Create the Text Field that used in the whole application and it takes the field title, controller and the keyboard type.
*/

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/core/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.textFieldTitle, required this.fieldController, required this.fieldKeyboardType});

  final String textFieldTitle;
  final TextEditingController fieldController;
  final TextInputType fieldKeyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: GradientBoxBorder(gradient: AppColors.vUtDLinearDarkGrid, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        keyboardType: fieldKeyboardType,
        cursorColor: AppColors.mainColor,
        controller: fieldController,
        style: TextStyle(
          color: AppColors.mainColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textFieldTitle,
          hintStyle: TextStyle(
            color: AppColors.fourthColor.withOpacity(0.75),
          ),
        ),
      ),
    );
  }
}
