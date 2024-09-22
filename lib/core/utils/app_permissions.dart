import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  /// This function will request all necessary permissions when called
  static Future<void> requestPermissions() async {
    // Request Bluetooth permission (for Android)
    PermissionStatus bluetoothPermissionStatus = await Permission.bluetooth.request();

    // For Android 12+, request scan and connect permissions
    if (await Permission.bluetoothScan.isDenied) {
      await Permission.bluetoothScan.request();
    }
    if (await Permission.bluetoothConnect.isDenied) {
      await Permission.bluetoothConnect.request();
    }

    // Optionally, request location permission for Bluetooth LE or GPS
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }

    // Handle storage/USB permission if using USB printers
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }

    // Check if Bluetooth permission is granted
    if (bluetoothPermissionStatus.isGranted) {
    } else {
      openAppSettings(); // Redirect to settings if denied
    }
  }
}