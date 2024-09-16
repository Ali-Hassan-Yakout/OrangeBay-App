import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/card_activation_body.dart';

class CardActivationView extends StatelessWidget {
  final String uid;

  const CardActivationView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(height: 8.h), // Adjust the height as needed for spacing
          Expanded(
            child: CardActivationBody(uid: uid),
          ),
        ],
      ),
    );
  }
}
