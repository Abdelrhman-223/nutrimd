/*
**********Project Name: nutrimd
**********File Name: profile_controller
**********Created At: 06-May-24 11:28 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';

class ProfileController extends GetxController {
  Map<String, bool> activatedField = {
    "Personal Data": true,
    "Physical Data": false,
    "Medical Data": false,
    "Analysis Results": false,
  };

  activePage(String page) {
    activatedField.update("Personal Data", (value) => false);
    activatedField.update("Physical Data", (value) => false);
    activatedField.update("Medical Data", (value) => false);
    activatedField.update("Analysis Results", (value) => false);
    activatedField[page] = true;

    update();
  }

  notActivePage(String page) {
    activatedField.update("Personal Data", (value) => true);
    activatedField[page] = false;

    update();
  }
}
