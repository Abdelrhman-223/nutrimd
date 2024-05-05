/*
**********Project Name: nutrimd
**********File Name: auth_radio_buttons
**********Created At: 15-Apr-24 11:48 AM
**********Author: Abdelrhman Hussein
**********Description: Create a radio button of tow values, and it take the list of values and the current value.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrimd/authentication_pages/presentation/manager/auth_data_controller.dart';

import '../../../core/utils/app_colors.dart';

class AuthRadioButtons extends StatelessWidget {
  AuthRadioButtons({super.key, required this.radioItemsList, required this.buttonId, required this.chosenItem});

  final List<String> radioItemsList;
  late String chosenItem, buttonId;

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<AuthDataController>(
        init: AuthDataController(),
        builder: (authDataController) {
          return StatefulBuilder(
            builder: (context, setState) => Row(
              children: [
                // Make it as expanded to put tow buttons in the same row.
                Expanded(
                  flex: 1,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    title: Text(
                      radioItemsList[0],
                      style: TextStyle(color: AppColors.mainColor),
                    ),
                    leading: Radio<String>(
                      groupValue: chosenItem,
                      value: radioItemsList[0],
                      activeColor: AppColors.secondColor,
                      onChanged: (value) {
                        setState(() {
                          // if the button clicked it will make the the current value of the button is the chosen value.
                          chosenItem = value!;
                          authDataController.saveRadioButtonValue(buttonId, value);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    title: Text(
                      radioItemsList[1],
                      style: TextStyle(color: AppColors.mainColor),
                    ),
                    leading: Radio<String>(
                      groupValue: chosenItem,
                      value: radioItemsList[1],
                      activeColor: AppColors.secondColor,
                      onChanged: (value) {
                        // if the button clicked it will make the the current value of the button is the chosen value.
                        setState(() {
                          chosenItem = value!;
                          authDataController.saveRadioButtonValue(buttonId, value);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      );
  }
}
