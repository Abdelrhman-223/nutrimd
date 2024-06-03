/*
**********Project Name: nutrimd
**********File Name: logout_button
**********Created At: 12-May-24 5:43 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../../../main.dart';
import '../../../on_boarding/presentation/pages/splash_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.fifthColor,
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: AppColors.redColor,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  sharedPreferences.setBool("logging", false);
                  Get.offAll(const SplashScreen());
                },
              ),
            ],
            content: Text(
              "Are you sure to log out?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18,
              ),
            ),
          ),
        );
      },
      leading: SvgPicture.asset(
        AppIcons.logout,
        color: AppColors.redColor,
      ),
      horizontalTitleGap: 8,
      title: Text(
        "Log-Out",
        style: TextStyle(
          color: AppColors.redColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
