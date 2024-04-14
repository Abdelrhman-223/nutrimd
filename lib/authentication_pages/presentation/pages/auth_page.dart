/*
**********Project Name: nutrimd
**********File Name: sign_in_page
**********Created At: 14-Apr-24 7:40 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nutrimd/authentication_pages/presentation/pages/sign_in_page.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_tab_bar.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';
import 'package:nutrimd/core/widgets/logo_title.dart';

import '../manager/auth_tab_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      body: SafeArea(
        child: GetBuilder<AuthTabController>(
            init: AuthTabController(),
            builder: (authTabController) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: LogoAndTitle(fieldAlignment: CrossAxisAlignment.start),
                    ),
                    spaceVertical32(),
                    const AuthTabBar(),
                    spaceVertical16(),
                    Text(
                      authTabController.authPageAlert,
                      style: TextStyle(
                        color: AppColors.fourthColor,
                        fontSize: AppFonts.myP3,
                      ),
                    ),
                    spaceVertical32(),
                    Expanded(
                      child: PageView(
                        controller: authTabController.pageController,
                        onPageChanged: (value) {
                          (value == 0)
                              ? authTabController.tabOnSignIn()
                              : authTabController.tabOnSignUp();
                        },
                        children: [
                          SignInPage(),
                          SignInPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
