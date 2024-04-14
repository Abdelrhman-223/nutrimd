/*
**********Project Name: nutrimd
**********File Name: slider_button
**********Created At: 13-Apr-24 9:43 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/on_boarding/presentation/manager/slider_button_controller.dart';

class SliderButton extends StatelessWidget {
  const SliderButton({
    super.key,
    required this.iconPath,
    required this.hiddenButton,
    required this.buttonType,
  });

  final String iconPath;
  final bool hiddenButton, buttonType;

  // Button Type if it "true" so is next button and if it "false" is previous.

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderButtonController>(
        init: SliderButtonController(),
        builder: (sliderButtonController) {
          return Container(
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: (hiddenButton)
                    ? const LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      )
                    : AppColors.vUtDLinearDarkGrid,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                if (buttonType) {
                  sliderButtonController.nextPage();
                } else {
                  sliderButtonController.previousPage();
                }
              },
              icon: SvgPicture.asset(
                iconPath,
                color: (hiddenButton) ? Colors.transparent : AppColors.mainColor,
              ),
            ),
          );
        });
  }
}
