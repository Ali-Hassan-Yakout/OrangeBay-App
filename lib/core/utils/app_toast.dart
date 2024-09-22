import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class AppToast {
  static void displayToast({
    required String message,
    required bool isError,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? AppColors.errorColor : AppColors.successColor,
      textColor: Colors.white,
      fontSize: 18,
    );
  }
}
