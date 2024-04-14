/*
**********Project Name: nutrimd
**********File Name: auth_tab_bar
**********Created At: 14-Apr-24 9:29 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nutrimd/authentication_pages/presentation/widgets/tab_bar_button.dart';
import '../manager/auth_tab_controller.dart';

class AuthTabBar extends StatelessWidget {
  const AuthTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthTabController>(
    init: AuthTabController(),
      builder: (context) {
        return const Row(
          children: [
            TabBarButton(buttonTitle: "Sign-In", buttonType: true),
            TabBarButton(buttonTitle: "Sign-Up", buttonType: false),
          ],
        );
      }
    );
  }
}
