/*
**********Project Name: nutrimd
**********File Name: password_field
**********Created At: 14-Apr-24 11:47 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/core/utils/app_icons.dart';

import '../../../core/utils/app_colors.dart';

class PasswordField extends StatelessWidget {
  PasswordField({super.key, required this.textFieldTitle, required this.fieldController});

  final String textFieldTitle;
  bool hiddenPass = true;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
        decoration: BoxDecoration(
          border: GradientBoxBorder(gradient: AppColors.vUtDLinearDarkGrid, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          obscureText: hiddenPass,
          cursorColor: AppColors.mainColor,
          style: TextStyle(
            color: AppColors.mainColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: textFieldTitle,
            hintStyle: TextStyle(
              color: AppColors.fourthColor.withOpacity(0.75),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hiddenPass = !hiddenPass;
                });
              },
              icon: (hiddenPass)?SvgPicture.asset(IconPaths.eyeHidden):SvgPicture.asset(IconPaths.eyeVisible),
            ),
          ),
        ),
      );
    });
  }
}
