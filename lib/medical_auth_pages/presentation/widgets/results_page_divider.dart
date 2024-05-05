/*
**********Project Name: nutrimd
**********File Name: results_page_divider
**********Created At: 23-Apr-24 12:49 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';

class ResultsDivider extends StatelessWidget {
  const ResultsDivider({super.key, required this.status});

  final bool status;

  final int dashCount = 50, dashGap = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(dashCount, (_) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / dashCount - dashGap,
                  height: 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: (status) ? AppColors.secondColor : Colors.red,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),
          /*Align(
            alignment: const Alignment(0, 0),
            child: Container(
              height: 2,
              color: (status) ? AppColors.secondColor : Colors.red,
            ),
          ),*/
          Align(
            alignment: const Alignment(0, 0),
            child: Container(
              color: AppColors.fifthColor,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                (status) ? "Good Results" : "Bad Results",
                style: TextStyle(
                  color: (status) ? AppColors.secondColor : AppColors.redColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
