import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class CheckOutTable extends StatelessWidget {
  const CheckOutTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("بيبسي"),
                Container(
                  color: AppColors.blue,
                  height: MediaQuery.of(context).size.height / 25,
                  width: 1,
                ),
                const Text("2*10"),
                Container(
                  color: AppColors.blue,
                  height: MediaQuery.of(context).size.height / 25,
                  width: 1,
                ),
                const Text("20 نقطه")
              ],
            ),
        separatorBuilder: (context, index) => const Divider(
              color: AppColors.blue,
            ),
        itemCount: 3);
  }
}
