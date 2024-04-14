/*
**********Project Name: nutrimd
**********File Name: slider_content
**********Created At: 19-Mar-24 10:55 AM
**********Author: Abdelrhman Hussein
**********Description: Create the slider content to show the
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_fonts.dart';

class SliderContent extends StatefulWidget {
  final String imgPath, description;

  const SliderContent(
      {Key? key, required this.imgPath, required this.description})
      : super(key: key);

  @override
  State<SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<SliderContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          widget.imgPath,
          height: 300,
        ),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: AppFonts.myH6,
          ),
        ),
      ],
    );
  }
}
