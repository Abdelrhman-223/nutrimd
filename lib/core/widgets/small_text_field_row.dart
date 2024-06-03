/*
**********Project Name: nutrimd
**********File Name: small_text_field_row
**********Created At: 16-Apr-24 11:20 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import 'app_text_field.dart';

class SmallTextFieldRow extends StatelessWidget {
  const SmallTextFieldRow({super.key, required this.firstFieldTitle, required this.secondFieldTitle, required this.firstFieldController, required this.secondFieldController, required this.fieldKeyboardType});

  final String firstFieldTitle, secondFieldTitle;
  final TextEditingController firstFieldController, secondFieldController;
  final TextInputType fieldKeyboardType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          child: AppTextField(
            textFieldTitle: firstFieldTitle,
            fieldController: firstFieldController,
            fieldKeyboardType: fieldKeyboardType,
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          child: AppTextField(
            textFieldTitle: secondFieldTitle,
            fieldController: secondFieldController,
            fieldKeyboardType: fieldKeyboardType,
          ),
        ),
      ],
    );
  }
}
