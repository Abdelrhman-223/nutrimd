/*
**********Project Name: nutrimd
**********File Name: message_field
**********Created At: 05-May-24 8:42 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class MessageField extends StatelessWidget {
  const MessageField({
    super.key,
    required this.isItFromUser,
    required this.fieldContent,
  });

  final bool isItFromUser;
  final String fieldContent;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (isItFromUser) ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: (isItFromUser) ? AppColors.mainColor : AppColors.secondColor,
            borderRadius: (isItFromUser)
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(25),
                  )
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(0),
                  ),
          ),
          child: Text(
            fieldContent,
            style: TextStyle(
              color: AppColors.fifthColor,
            ),
          ),
        ),
      ),
    );
  }
}
