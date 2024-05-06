/*
**********Project Name: nutrimd
**********File Name: tab_bar_button
**********Created At: 14-Apr-24 10:07 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/history_page/presentation/manager/history_tab_controller.dart';

import '../../../core/utils/app_colors.dart';

class HistoryTabBarButton extends StatelessWidget {
  const HistoryTabBarButton({super.key, required this.buttonTitle, required this.buttonType});

  final String buttonTitle;
  final bool buttonType; // true => sign in / false => sign up.

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryTabController>(
        init: HistoryTabController(),
        builder: (historyTabController) {
          return GestureDetector(
            onTap: () {
              (buttonType) ? historyTabController.tabOnUsed() : historyTabController.tabOnPurchased();
            },
            child: Container(
              width: (MediaQuery.of(context).size.width - 32) / 2,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: (historyTabController.buttonClicked == buttonTitle)
                    ? AppColors.hLtRLinearDarkGrid
                    : null,
                border: GradientBoxBorder(
                  gradient: AppColors.vUtDLinearDarkGrid,
                  width: 2,
                ),
                borderRadius: (buttonType)
                    ? const BorderRadius.horizontal(left: Radius.circular(15))
                    : const BorderRadius.horizontal(right: Radius.circular(15)),
              ),
              child: Text(
                buttonTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (historyTabController.buttonClicked == buttonTitle)
                      ? AppColors.fifthColor
                      : AppColors.mainColor,
                  fontSize: 22,
                ),
              ),
            ),
          );
        });
  }
}