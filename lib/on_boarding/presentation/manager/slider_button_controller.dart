/*
**********Project Name: nutrimd
**********File Name: slider_button_controller
**********Created At: 14-Apr-24 6:43 AM
**********Author: Abdelrhman Hussein
**********Description: This page to code the controller and manage the state management of the onboarding page.
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../authentication_pages/presentation/pages/auth_page.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_strings.dart';
import '../../../main.dart';
import '../widgets/slider_content.dart';

class SliderButtonController extends GetxController {
  // to change the pageView content and it starts from 1 to slider pages length.
  int pageIndex = 1;
  PageController pageController = PageController();

  List<Widget> sliderPages = [
    SliderContent(
      imgPath: ImagePaths.medicalTestsSvg,
      description: AppStrings.medicalTestsPageDescription,
    ),
    SliderContent(
      imgPath: ImagePaths.dietProtocolSvg,
      description: AppStrings.dietProtocolPageDescription,
    ),
    SliderContent(
      imgPath: ImagePaths.productHuntSvg,
      description: AppStrings.productHuntPageDescription,
    ),
    SliderContent(
      imgPath: ImagePaths.barcodeSvg,
      description: AppStrings.barcodePageDescription,
    ),
    SliderContent(
      imgPath: ImagePaths.smartwatchSvg,
      description: AppStrings.smartwatchPageDescription,
    ),
  ];

  nextPage() {
    // Change view to the next page during clicking on the next button.
    if (pageIndex < sliderPages.length) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    } else {
      sharedPreferences.setBool("finishOnBoarding", true);
      Get.to(const AuthPage());
    }
    update();
  }

  previousPage() {
    // Change view to the previous page during clicking on the previous button.
    pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    update();
  }

  slideToPage(int index) {
    // Change view to the next or previous page during scrolling.
    //add 1 on index to make navigator work.
    pageIndex = index + 1;

    update();
  }
}
