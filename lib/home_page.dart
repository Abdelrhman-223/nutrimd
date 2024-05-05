/*
**********Project Name: nutrimd
**********File Name: home_page_diet_protocol
**********Created At: 19-Mar-24 10:38 AM
**********Author: Abdelrhman Hussein
**********Description: View the user diet protocol and the products that he used during the day. if the app system is family this page will view just the diet protocols of him and his family members and don't view the product used.
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/chatbot_page/presentation/pages/chatbot_page.dart';
import 'package:nutrimd/core/components/bottom_nav_bar_button.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';
import 'package:nutrimd/core/utils/app_images.dart';
import 'package:nutrimd/diet_protocol/presentation/pages/diet_protocol_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> pagesTitle = [
    "Settings",
    "History",
    "Diet Protocol",
    "Products",
    "Chatbot",
  ];
  List<Widget> bottomNavBarPages = [
    DietProtocolPage(),
    DietProtocolPage(),
    DietProtocolPage(),
    DietProtocolPage(),
    ChatBotPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarButtonController>(
        init: BottomNavBarButtonController(),
        builder: (buttonController) {
          return Scaffold(
            backgroundColor: AppColors.fifthColor,
            drawer: SafeArea(
              child: Drawer(
                backgroundColor: AppColors.thirdColor,
                shadowColor: AppColors.fifthColor,
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.fifthColor,
              leadingWidth: 75,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(ImagePaths.logoSvg),
              ),
              bottom: PreferredSize(
                preferredSize: Size(
                  MediaQuery.of(context).size.width,
                  1,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: GradientBoxBorder(gradient: AppColors.hLtRLinearDarkGrid, width: 1),
                  ),
                ),
              ),
              title: Text(
                pagesTitle[buttonController.activeButtonIndex],
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
              actions: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: SvgPicture.asset(AppIcons.menu),
                    );
                  }
                ),
              ],
            ),
            body: IndexedStack(
              index: buttonController.activeButtonIndex,
              children: bottomNavBarPages,
            ),
            bottomNavigationBar: Container(
              height: 90.0,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BottomNavBarButton(buttonIndex: 0, buttonIconPath: AppIcons.settings),
                  BottomNavBarButton(buttonIndex: 1, buttonIconPath: AppIcons.history),
                  (buttonController.activeButtonIndex == 2)
                      ? BottomNavBarButton(
                          buttonIndex: 2,
                          buttonIconPath: AppIcons.scanner,
                          activeScanner: true,
                        )
                      : BottomNavBarButton(
                          buttonIndex: 2,
                          buttonIconPath: AppIcons.home,
                        ),
                  BottomNavBarButton(buttonIndex: 3, buttonIconPath: AppIcons.product),
                  BottomNavBarButton(buttonIndex: 4, buttonIconPath: AppIcons.chatBot),
                ],
              ),
            ),
          );
        });
  }
}
