/*
**********Project Name: nutrimd
**********File Name: results_page_divider
**********Created At: 23-Apr-24 12:49 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/utils/app_colors.dart';

class ResultsDivider extends StatelessWidget {
  const ResultsDivider({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: AppColors.fifthColor,
            child: Text(
              (status) ? "Good Results" : "Bad Results",
              style: TextStyle(
                color: (status) ? AppColors.secondColor : AppColors.redColor,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: (status) ? AppColors.secondColor : Colors.red,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
