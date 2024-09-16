import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';

class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> adminLabels = [
      "Card activation",
      "Recharge",
      "Refund",
      "Replacement card",
      "Card Inquiry",
      "Transactions",
      "Buy Ticket",
      "Tour Guide Profit",
    ];
    final List<List<Color>> gradientBg = [
      [
        const Color(0xFF1992D1),
        const Color.fromRGBO(135, 76, 204, 0.45),
      ],
      [
        const Color(0xFF1C1678),
        const Color.fromRGBO(133, 118, 255, 0.45),
      ],
      [
        const Color(0xFFC4E4FF),
        const Color.fromRGBO(216, 149, 218, 0.45),
      ],
      [
        const Color(0xFF1992D1),
        const Color.fromRGBO(230, 185, 222, 0.45),
      ],
      [
        const Color(0xFF1992D1),
        const Color.fromRGBO(150, 233, 198, 0.45),
      ],
      [
        const Color(0xFF1992D1),
        const Color.fromRGBO(234, 223, 180, 0.45),
      ],
      [
        const Color.fromRGBO(216, 149, 218, 0.45),
        const Color.fromRGBO(150, 233, 198, 0.45),
      ],
      [
        const Color.fromRGBO(234, 223, 180, 0.45),
        const Color.fromRGBO(216, 149, 218, 0.45),
      ],
    ];
    List<IconData> adminIcons = [
      Icons.add_card,
      Icons.add_circle_outline_outlined,
      Icons.remove_circle_outline,
      Icons.sim_card_download_outlined,
      Icons.info_outline_rounded,
      Icons.receipt_long_outlined,
      Icons.airplane_ticket_outlined,
      Icons.percent_outlined,
    ];
    List<String> adminLocations = [
      AppRouter.cardActivation,
      AppRouter.addMoneyAuth,
      AppRouter.refundAuth,
      AppRouter.replacementCard,
      AppRouter.cardInfoAuth,
      AppRouter.adminTransactionsHistoryAuth,
      AppRouter.ticket,
      AppRouter.tourGuideProfit,
    ];
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        itemCount: adminLabels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(adminLocations[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: gradientBg[index],
                  stops: const [0.0, 1.0],
                ),
              ),
              margin: EdgeInsets.all(8.0.r),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: MediaQuery.of(context).size.width / 16.r,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: MediaQuery.of(context).size.width / 20.r,
                        child: Icon(
                          adminIcons[index],
                          color: AppColors.mainOrange,
                        ),
                      ),
                    ),
                    Text(
                      adminLabels[index],
                      style: TextStyle(fontSize: 16.0.sp),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
