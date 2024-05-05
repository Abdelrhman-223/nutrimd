/*
**********Project Name: qr_ar
**********File Name: qr_function
**********Created At: 16-Mar-24 5:18 PM
**********Author: Abdelrhman Hussein
**********Description: the function of the qr code scanner.
*/
import 'package:flutter/material.dart';
import 'code_toast.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

String? qrScanner(BuildContext context) {
  /// I'm editing the package source code to make some variations of the widget.
  // This code to create an instance of the package.
  final qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
    //It takes the context of the parent widget to show it correctly.
    context: context,
    onCode: (qrcode) {
      //when the qr codee scanned will show toast to view the code as text.
      codeToast(qrcode);
      //It returns the code if you want to use it in another codes.
      return qrcode;
    },
  );
}
