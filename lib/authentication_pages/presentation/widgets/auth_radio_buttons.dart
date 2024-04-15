/*
**********Project Name: nutrimd
**********File Name: auth_radio_buttons
**********Created At: 15-Apr-24 11:48 AM
**********Author: Abdelrhman Hussein
**********Description: Create a radio button of tow values, and it take the list of values and the current value.
*/

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class AuthRadioButtons extends StatelessWidget {
  AuthRadioButtons({super.key, required this.radioItemsList, required this.chosenItem});

  final List<String> radioItemsList;
  late String chosenItem;
  @override
  Widget build(BuildContext context) {
    return
      StatefulBuilder(
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
                  value: radioItemsList[0],
                  activeColor: AppColors.secondColor,
                  groupValue: chosenItem,
                  onChanged: (value) {
                    setState(() {
                      // if the button clicked it will make the the current value of the button is the chosen value.
                      chosenItem = value!;
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
                  value: radioItemsList[1],
                  activeColor: AppColors.secondColor,
                  groupValue: chosenItem,
                  onChanged: (value) {
                    // if the button clicked it will make the the current value of the button is the chosen value.
                    setState(() {
                      chosenItem = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}
