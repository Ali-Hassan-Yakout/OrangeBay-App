import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/admin/presentation/views/widgets/card_info_body.dart';

class CardInfoView extends StatelessWidget {
  const CardInfoView({super.key});

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
          SizedBox(height: 8.h),
          // Adjust the height as needed for spacing
          const Expanded(child: CardInfoBody()),
        ],
      ),
    );
  }
}
