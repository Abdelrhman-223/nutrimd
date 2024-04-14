/*
**********Project Name: nutrimd
**********File Name: home_page_diet_protocol
**********Created At: 19-Mar-24 10:38 AM
**********Author: Abdelrhman Hussein
**********Description: View the user diet protocol and the products that he used during the day. if the app system is family this page will view just the diet protocols of him and his family members and don't view the product used.
*/

import 'package:flutter/material.dart';
import 'package:nutrimd/core/utils/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.fifthColor,
        title: Text(
          "Diet Protocol",
          style: TextStyle(
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Diet Protocol will appear here :)',
              style: TextStyle(
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
