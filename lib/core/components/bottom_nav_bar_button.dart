/*
**********Project Name: nutrimd
**********File Name: bottom_nav_bar_button
**********Created At: 04-May-24 8:54 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutrimd/home_page/presentation/manager/qr_controller.dart';
import 'package:nutrimd/core/utils/app_colors.dart';

class BottomNavBarButtonController extends GetxController {
  int activeButtonIndex = 2;

  changeButtonIndex(int index) {
    activeButtonIndex = index;

    update();
  }
}

class BottomNavBarButton extends StatelessWidget {
  BottomNavBarButton({super.key, required this.buttonIndex, required this.buttonIconPath, this.activeScanner = false});

  final int buttonIndex;
  final String buttonIconPath;
  final bool activeScanner;

  final double buttonSize = 50.0;

  QrScannerController qrScannerController = Get.put(QrScannerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarButtonController>(
        init: BottomNavBarButtonController(),
        builder: (buttonController) {
          return GestureDetector(
            onTap: () {
              buttonController.changeButtonIndex(buttonIndex);
              if(activeScanner){
                qrScannerController.qrScanner(context);
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: (buttonController.activeButtonIndex == buttonIndex)
                  ? buttonSize + 10
                  : buttonSize,
              height: (buttonController.activeButtonIndex == buttonIndex)
                  ? buttonSize + 10
                  : buttonSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: (buttonController.activeButtonIndex == buttonIndex)
                    ? AppColors.secondColor
                    : AppColors.fifthColor,
                border: (buttonController.activeButtonIndex == buttonIndex)
                    ? Border(
                        bottom: BorderSide(
                          width: 3,
                          color: AppColors.mainColor,
                        ),
                      )
                    : Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
              child: SvgPicture.asset(buttonIconPath,),
            ),
          );
        });
  }
}
