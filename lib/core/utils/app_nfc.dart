import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:orange_bay/core/utils/app_toast.dart';

class AppNfc {
  String uid = "";

  Future<void> checkNfcAvailability(BuildContext context) async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (!isAvailable) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'NFC is not available',
        btnOkOnPress: () {},
        btnOkText: 'Ok',
      ).show();
    }
  }

  Future<void> readNfcUid() async {
    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        AppToast.displayToast(
          message: 'NFC tag detected',
          isError: false,
        );

        // Extract UID from the tag data
        final tech = tag.data['nfca'] ??
            tag.data['nfcb'] ??
            tag.data['nfcf'] ??
            tag.data['nfcv'];
        if (tech != null && tech.containsKey('identifier')) {
          uid = tech['identifier']
              .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
              .join(':');
          AppToast.displayToast(
            message: 'Reading UID success',
            isError: false,
          );
        } else {
          AppToast.displayToast(
            message: 'No UID found',
            isError: true,
          );
        }
        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      AppToast.displayToast(
        message: 'Error reading NFC UID',
        isError: true,
      );
      await NfcManager.instance.stopSession(errorMessage: e.toString());
    }
  }

  Future<Map<String, dynamic>?> readNfcData() async {
    try {
      Map<String, dynamic>? data;
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        AppToast.displayToast(
          message: 'NFC tag detected',
          isError: false,
        );

        final ndef = Ndef.from(tag);
        if (ndef == null) {
          AppToast.displayToast(
            message: 'Tag is not NDEF compliant',
            isError: true,
          );
          await NfcManager.instance.stopSession();
          return;
        }

        final cachedMessage = ndef.cachedMessage;
        if (cachedMessage == null) {
          AppToast.displayToast(
            message: 'No NDEF message on the tag',
            isError: true,
          );
          await NfcManager.instance.stopSession();
          return;
        }

        for (final record in cachedMessage.records) {
          if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
              record.payload.isNotEmpty) {
            String payload = utf8.decode(record.payload.skip(3).toList());
            data = jsonDecode(payload);
          }
        }

        await NfcManager.instance.stopSession();
      });
      return data;
    } catch (e) {
      AppToast.displayToast(
        message: 'Error reading NFC data',
        isError: true,
      );
      await NfcManager.instance.stopSession(errorMessage: e.toString());
      return null;
    }
  }

  Future<void> writeNfcData(Map<String, dynamic> data) async {
    String jsonString = jsonEncode(data);

    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        AppToast.displayToast(
          message: 'NFC tag detected',
          isError: false,
        );

        final ndef = Ndef.from(tag);
        if (ndef == null) {
          AppToast.displayToast(
            message: 'Tag is not NDEF compliant',
            isError: true,
          );
          return;
        }

        final message = NdefMessage([
          NdefRecord.createText(jsonString),
        ]);

        await ndef.write(message);
        AppToast.displayToast(
          message: 'NDEF record written successfully',
          isError: false,
        );

        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      AppToast.displayToast(
        message: 'Error writing NFC data',
        isError: true,
      );
      await NfcManager.instance.stopSession(errorMessage: e.toString());
    }
  }
}
