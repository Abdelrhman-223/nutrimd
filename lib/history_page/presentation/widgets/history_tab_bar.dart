/*
**********Project Name: nutrimd
**********File Name: auth_tab_bar
**********Created At: 14-Apr-24 9:29 AM
**********Author: Abdelrhman Hussein
**********Description: Create the authentication tab bar to switch between the sign in and sign up pages.
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nutrimd/history_page/presentation/widgets/history_tab_bar_button.dart';
import '../manager/history_tab_controller.dart';

class HistoryTabBar extends StatelessWidget {
  const HistoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryTabController>(
    init: HistoryTabController(),
      builder: (context) {
        return const Row(
          children: [
            HistoryTabBarButton(buttonTitle: "Used", buttonType: true),
            HistoryTabBarButton(buttonTitle: "Purchased", buttonType: false),
          ],
        );
      }
    );
  }
}
