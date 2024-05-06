/*
**********Project Name: nutrimd
**********File Name: page_separator
**********Created At: 06-May-24 10:09 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PageSeparator extends StatelessWidget {
  const PageSeparator({super.key, required this.separatorTitle});

  final String separatorTitle;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.hLtRLinearDarkGrid,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Text(
          separatorTitle,
          style: TextStyle(
            color: AppColors.fifthColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
