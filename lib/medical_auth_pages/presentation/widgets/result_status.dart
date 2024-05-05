/*
**********Project Name: nutrimd
**********File Name: result_status
**********Created At: 23-Apr-24 12:24 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';

class ResultStatus extends StatelessWidget {
  const ResultStatus({super.key, required this.disease, required this.status});

  final String disease;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: (!status) ? AppColors.secondColor : AppColors.redColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            (!status) ? IconPaths.goodForYou : IconPaths.badForYou,
          ),
          spaceHiresontal16(),
          Text(
            disease,
            style: TextStyle(
              color: AppColors.fifthColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
