import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/ticket/presentation/views/ticket_body.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                top: 40.h,
                left: 16.w,
              ),
              child: Image.asset(
                AssetData.logo,
                height: 35.h,
              ),
            ),
            const Expanded(child: TicketBody()),
          ],
        ),
      ),
    );
  }
}
