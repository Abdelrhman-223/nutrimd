/*
**********Project Name: nutrimd
**********File Name: drawer_button
**********Created At: 12-May-24 5:37 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';

class MyDrawerButton extends StatelessWidget {
  const MyDrawerButton(
      {super.key,
      required this.buttonFunction,
      required this.buttonTitle,
      required this.buttonIcon});

  final Function() buttonFunction;
  final String buttonTitle, buttonIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: buttonFunction,
      leading: SvgPicture.asset(buttonIcon),
      horizontalTitleGap: 8,
      title: Text(
        buttonTitle,
        style: TextStyle(
          color: AppColors.fifthColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
