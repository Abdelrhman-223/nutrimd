/*
**********Project Name: nutrimd
**********File Name: sign_in_page
**********Created At: 14-Apr-24 7:40 AM
**********Author: Abdelrhman Hussein
**********Description: This page contain the structure of the page and is the logo and title, tab bar and page view.
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../manager/auth_tab_controller.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/widgets/logo_title.dart';
import 'package:nutrimd/authentication_pages/presentation/pages/sign_in_page.dart';
import 'package:nutrimd/authentication_pages/presentation/pages/sign_up_page.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/auth_tab_bar.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      body: SafeArea(
        // Connect the page with The tab bar controller by getx state management.
        child: GetBuilder<AuthTabController>(
            init: AuthTabController(),
            builder: (authTabController) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo and Title view in the top left corner.
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: LogoAndTitle(fieldAlignment: CrossAxisAlignment.start, logoWidth: 100,),
                    ),
                    spaceVertical32(),
                    const AuthTabBar(),
                    spaceVertical16(),
                    // Page alert that appears to the user to check if is has an account to sign in or not to sign up.
                    Text(
                      authTabController.authPageAlert,
                      style: TextStyle(
                        color: AppColors.fourthColor,
                        fontSize: AppFonts.myP3,
                      ),
                    ),
                    spaceVertical32(),
                    // View the pages in page view to easy switch between them and i put it in expanded widget to take the rest of the body height.
                    Expanded(
                      child: PageView(
                        controller: authTabController.pageController,
                        onPageChanged: (value) {
                          // Change the page by scrolling, if the page on index 0 will go to the Sign-In page and if it 1 will go to Sign-Up page.
                          (value == 0)
                              ? authTabController.tabOnSignIn()
                              : authTabController.tabOnSignUp();
                        },
                        children: [
                          SignInPage(),
                          SignUpPage(),
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
