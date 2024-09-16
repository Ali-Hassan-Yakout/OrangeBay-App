import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:orange_bay/core/utils/assets.dart';

class AppPrint {
  final BlueThermalPrinter _printer = BlueThermalPrinter.instance;

  static final AppPrint _instance = AppPrint._internal();

  factory AppPrint() => _instance;

  AppPrint._internal();

  Future<List<BluetoothDevice>> getBondedDevices() async {
    return await _printer.getBondedDevices();
  }

  Future<void> connect(BluetoothDevice device) async {
    await _printer.connect(device);
  }

  Future<void> disconnect() async {
    await _printer.disconnect();
  }

  Future<void> printLogo() async {
    ByteData data = await rootBundle.load(AssetData.blackLogo);
    Uint8List logoBytes = data.buffer.asUint8List();
    _printer.printImageBytes(logoBytes); // Print image from bytes
  }

  Future<void> printText(String text) async {
    await _printer.printCustom(text, 3, 0);
  }

  Future<void> printLogoAndText(String text) async {
    _printer.printNewLine();
    await printLogo();
    _printer.printNewLine();
    await printText(text);
    _printer.printNewLine();
  }

  Future<void> printReceipt(
    String headerText,
    String footerText,
    String qrCode,
  ) async {
    await printLogo();
    await printText(headerText);
    await _printer.printQRcode(qrCode, 200, 200, 1);
    await _printer.printCustom(footerText, 3, 1);
  }

  Future<bool> isConnected() async {
    return await _printer.isConnected ?? false;
  }
}
