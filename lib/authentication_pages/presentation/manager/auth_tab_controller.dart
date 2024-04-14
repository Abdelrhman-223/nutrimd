/*
**********Project Name: nutrimd
**********File Name: auth_tab_controller
**********Created At: 14-Apr-24 10:05 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTabController extends GetxController {
  String buttonClicked = "Sign-In", authPageAlert = "If you don’t have an account, go to Sign-Up";
  // int buttonClickedIndex = 0; // 0 => sign in / 1 => sign up.
  PageController pageController = PageController(initialPage: 0);

  tabOnSignIn() {
    buttonClicked = "Sign-In";
    authPageAlert = "If you don’t have an account, go to Sign-Up";
    // buttonClickedIndex = 0;
    pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    update();
  }
  tabOnSignUp() {
    buttonClicked = "Sign-Up";
    authPageAlert = "If you have an account, go to Sign-In";
    // buttonClickedIndex = 1;
    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    update();
  }
}