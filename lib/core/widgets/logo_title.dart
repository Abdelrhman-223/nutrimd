/*
**********Project Name: nutrimd
**********File Name: logo_title
**********Created At: 13-Apr-24 9:17 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key, required this.fieldAlignment, required this.logoWidth});

  final CrossAxisAlignment fieldAlignment;
  final double logoWidth;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: fieldAlignment,
      children: [
        SvgPicture.asset(
          ImagePaths.logoSvg,
          cacheColorFilter: true,
          width: logoWidth,
        ),
        Text(
          AppStrings.appTitle,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ),
        ),
        Text(
          AppStrings.appSlogan,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.fourthColor,
          ),
        ),
      ],
    );
  }
}
