/*
**********Project Name: nutrimd
**********File Name: app_colors
**********Created At: 19-Mar-24 10:43 AM
**********Author: Abdelrhman Hussein
**********Description: This file contain the colors used in this app.
*/
import 'package:flutter/material.dart';

class AppColors {
  static Color mainColor = const Color.fromRGBO(17, 65, 76, 1);
  static Color secondColor = const Color.fromRGBO(34, 152, 87, 1);
  static Color thirdColor = const Color.fromRGBO(59, 183, 119, 1);
  static Color fourthColor = const Color.fromRGBO(76, 112, 120, 1);
  static Color fifthColor = const Color.fromRGBO(248, 245, 236, 1);
  static Color redColor = const Color.fromRGBO(144, 0, 0, 1);

  static LinearGradient vUtDLinearDarkGrid = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [mainColor, secondColor],
  );
  static LinearGradient vDtULinearDarkGrid = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [mainColor, secondColor],
  );
  static LinearGradient hLtRLinearDarkGrid = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mainColor, secondColor],
  );
  static LinearGradient hRtLLinearDarkGrid = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [mainColor, secondColor],
  );
}
