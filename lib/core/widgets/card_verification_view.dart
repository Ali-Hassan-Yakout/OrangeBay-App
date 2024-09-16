import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_bay/core/utils/app_nfc.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/assets.dart';

class CardVerificationView extends StatefulWidget {
  final String textMsg;
  final String newScreen;

  const CardVerificationView({
    super.key,
    required this.textMsg,
    required this.newScreen,
  });

  @override
  State<CardVerificationView> createState() => _CardVerificationViewState();
}

class _CardVerificationViewState extends State<CardVerificationView> {
  final appNfc = AppNfc();

  @override
  void initState() {
    super.initState();
    verify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(AssetData.nfcRead),
      ),
    );
  }

  Future<void> verify() async {
    try {
      await appNfc.readNfcUid();
      Timer(
        const Duration(seconds: 5),
        () {
          if (appNfc.uid == '') {
            GoRouter.of(context).pushReplacement(AppRouter.admin);
          } else {
            GoRouter.of(context)
                .pushReplacement(widget.newScreen, extra: appNfc.uid);
          }
        },
      );
    } catch (error) {
      print('The cause of the error : $error');
    }
  }
}
