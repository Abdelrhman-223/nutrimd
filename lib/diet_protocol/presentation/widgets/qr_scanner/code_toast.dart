/*
**********Project Name: qr_ar
**********File Name: code_toast
**********Created At: 17-Mar-24 6:08 AM
**********Author: Abdelrhman Hussein
**********Description: widget to show the scanned code from qr scanner.
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

codeToast(String? scannedCode) {
  Fluttertoast.showToast(
      msg: scannedCode!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}