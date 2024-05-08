/*
**********Project Name: nutrimd
**********File Name: auth_data_controller
**********Created At: 30-Apr-24 5:27 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';

class AuthDataController extends GetxController {
  Map<String, String> radioButtonValues = {
    "gender": "Male",
    "familyType": "Individual",
  };

  String birthDate = "";

  saveRadioButtonValue(String id, value){
    radioButtonValues[id] = value;
  }

  getBirthDate(String value){
    birthDate = value;
    update();
  }
}
