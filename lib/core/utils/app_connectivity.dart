import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AppConnectivity {
  static Future<bool> checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
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
}
