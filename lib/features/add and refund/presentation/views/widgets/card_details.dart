import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      height: size.height / 4,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: size.height / 18),
      decoration: BoxDecoration(
        color: AppColors.mainOrange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("50 نقطه"), Icon(Icons.wifi)],
          ),
          Text(
            "رحمه أسامه رجب يونس",
            style:
                textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
