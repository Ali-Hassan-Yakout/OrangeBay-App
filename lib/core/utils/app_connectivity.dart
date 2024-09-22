import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:go_router/go_router.dart';

class AppConnectivity {
  static Connectivity? _connectivity;
  static bool isShowing = false;

  static Connectivity _instance() {
    return _connectivity ??= Connectivity();
  }

  static void init() {
    _connectivity = _instance();
  }

  static Future<bool> checkConnection() async {
    final connectivityResult = await (_connectivity!.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkBluetooth() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    final BluetoothState state = await flutterBlue.state.first;
    return state == BluetoothState.on;
  }

  static void connectionListener(BuildContext context) {
    _connectivity!.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (!(result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi))) {
        if (!isShowing) {
          AwesomeDialog(
            context: context,
            animType: AnimType.rightSlide,
            dialogType: DialogType.warning,
            dismissOnTouchOutside: false,
            dismissOnBackKeyPress: false,
            onDismissCallback: (value){
              isShowing = false;
            },
            title: "Internet is not available",
            desc: 'Please check your internet connection and try again',
          ).show();
          isShowing = true;
        }
      } else {
        if (isShowing) {
          GoRouter.of(context).pop();
        }
      }
    });
  }
}
