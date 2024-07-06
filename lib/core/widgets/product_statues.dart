/*
**********Project Name: nutrimd
**********File Name: product_statues
**********Created At: 01-Jul-24 7:38 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductStatues extends StatelessWidget {
  const ProductStatues({super.key, required this.productStatues});

  final bool productStatues;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      decoration: BoxDecoration(
        color: productStatues?AppColors.secondColor:AppColors.redColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        productStatues?"Good":"Bad",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.fifthColor,
          fontSize: 22,
        ),
      ),
    );
  }
}
