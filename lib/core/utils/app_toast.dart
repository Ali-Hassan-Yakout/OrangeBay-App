import 'package:fluttertoast/fluttertoast.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class AppToast {
  static void displayToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.lightGrey,
      textColor: AppColors.mainOrange,
      fontSize: 18,
    );
  }
}
