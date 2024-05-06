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
import 'package:nutrimd/core/styles/dividers.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';
import 'package:nutrimd/core/utils/app_images.dart';
import 'package:nutrimd/diet_protocol/presentation/pages/diet_protocol_page.dart';
import 'package:nutrimd/history_page/presentation/pages/history_page.dart';
import 'package:nutrimd/products_page/presentation/pages/products_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double userImageSize = 100;
  List<String> pagesTitle = [
    "Profile",
    "History",
    "Diet Protocol",
    "Products",
    "Chatbot",
  ];
  List<Widget> bottomNavBarPages = [
    DietProtocolPage(),
    HistoryPage(),
    DietProtocolPage(),
    ProductsPage(),
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
                width: MediaQuery.of(context).size.width * 0.8,
                backgroundColor: AppColors.thirdColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SliverList.builder(itemBuilder: itemBuilder),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.fifthColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: userImageSize,
                            height: userImageSize,
                            margin: const EdgeInsets.only(
                              right: 16,
                              top: 16,
                              bottom: 16,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.fifthColor,
                              borderRadius: BorderRadius.circular(userImageSize / 2),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(ImagePaths.user),
                              ),
                              border: GradientBoxBorder(
                                  width: 10, gradient: AppColors.hRtLLinearDarkGrid),
                            ),
                          ),
                          Text(
                            "User Name",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spaceVertical16(),
                    ListTile(
                      onTap: () {},
                      leading: SvgPicture.asset(AppIcons.settings),
                      horizontalTitleGap: 8,
                      title: Text(
                        "Settings",
                        style: TextStyle(
                          color: AppColors.fifthColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
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
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: SvgPicture.asset(AppIcons.menu),
                  );
                }),
              ],
            ),
            body: IndexedStack(
              sizing: StackFit.expand,
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
                  BottomNavBarButton(buttonIndex: 0, buttonIconPath: AppIcons.profile),
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
