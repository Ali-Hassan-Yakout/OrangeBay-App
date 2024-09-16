import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/tour_guide_profit/presentation/views/tour_guide_profit_body.dart';

class TourGuideProfitView extends StatelessWidget {
  const TourGuideProfitView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            // Adjust the height as needed for spacing
            const Expanded(child: TourGuideProfitBody()),
          ],
        ),
      ),
    );
  }
}
