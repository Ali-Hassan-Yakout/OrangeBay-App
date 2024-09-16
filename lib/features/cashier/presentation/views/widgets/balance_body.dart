import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class BalanceBody extends StatelessWidget {
  const BalanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue),
          borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        title: Text(
          "النقاط المتاحة",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing:
            Text("2000 نقطة", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
