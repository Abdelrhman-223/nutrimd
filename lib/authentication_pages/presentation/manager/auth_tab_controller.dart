/*
**********Project Name: nutrimd
**********File Name: auth_tab_controller
**********Created At: 14-Apr-24 10:05 AM
**********Author: Abdelrhman Hussein
**********Description: Control the auth tab bar and the page view to switch between sign in and sign up.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTabController extends GetxController {
  // buttonClicked var to know which button is pressed.
  // authPageAlert var to write the message that appear to user, if him in sign in page will go to sign up and the opposite.
  String buttonClicked = "Sign-In", authPageAlert = "If you don’t have an account, go to Sign-Up";
  PageController pageController = PageController(initialPage: 0);

  tabOnSignIn() {
    // This function to go to the sign in page when tap on it
    buttonClicked = "Sign-In";
    authPageAlert = "If you don’t have an account, go to Sign-Up";
    // Use the page view controller to switch to Sign-In page that is the *previous* one cause the initial page is the sign in.
    pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    update();
  }
  tabOnSignUp() {
    // This function to go to the sign in page when tap on it
    buttonClicked = "Sign-Up";
    authPageAlert = "If you have an account, go to Sign-In";
    // Use the page view controller to switch to Sign-Up page that is the *next* one cause the initial page is the sign in.
    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    update();
  }
}