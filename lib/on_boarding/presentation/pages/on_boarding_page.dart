/*
**********Project Name: nutrimd
**********File Name: on_boarding_page
**********Created At: 19-Mar-24 10:55 AM
**********Author: Abdelrhman Hussein
**********Description: This page make a presentation to user when use tha app for the first time, to give him a knowledge about app features.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';
import 'package:nutrimd/core/widgets/logo_title.dart';
import 'package:nutrimd/on_boarding/presentation/widgets/slider_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../manager/slider_button_controller.dart';
import '../widgets/skip_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderButtonController>(
        init: SliderButtonController(),
        builder: (sliderButtonController) {
          return Scaffold(
            backgroundColor: AppColors.fifthColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LogoAndTitle(
                          fieldAlignment: CrossAxisAlignment.start, logoWidth: 100,
                        ),
                        SkipButton(),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        controller: sliderButtonController.pageController,
                        onPageChanged: (index) {
                          sliderButtonController.slideToPage(index);
                        },
                        children: sliderButtonController.sliderPages,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Previous page Button and if the number of page greater than 1 show the button other of that make a transparent button and that to show every thing in the same place.
                        (sliderButtonController.pageIndex > 1)
                            ? SliderButton(
                                iconPath: IconPaths.leftArrow,
                                hiddenButton: false,
                                buttonType: false,
                              )
                            : SliderButton(
                                iconPath: IconPaths.leftArrow,
                                hiddenButton: true,
                                buttonType: false,
                              ),
                        SmoothPageIndicator(
                          controller: sliderButtonController.pageController,
                          count: sliderButtonController.sliderPages.length,
                          effect: ScrollingDotsEffect(
                            activeDotColor: AppColors.mainColor,
                            dotColor: AppColors.thirdColor,
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotScale: 1.5,
                          ),
                        ),

                        // Next Page Button
                        SliderButton(
                          iconPath: IconPaths.rightArrow,
                          hiddenButton: false,
                          buttonType: true,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
