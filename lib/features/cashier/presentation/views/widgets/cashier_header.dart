import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/shared_preferences.dart';

class CashierHeader extends StatelessWidget {
  const CashierHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.blue),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('نقطه البيع'),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 20,
                    width: 20,
                    // padding: EdgeInsets.all(6),
                    margin: const EdgeInsets.all(2),
                    child: const Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Text(
                PreferenceUtils.getString(PrefKeys.userName),
              ),
            ],
          ),
          const Divider(
            color: AppColors.blue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.balance);
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.blue),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: const Text("معرفه الرصيد"),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.transactionHistory);
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                child: const Text("سجل المعاملات"),
              )
            ],
          )
        ],
      ),
    );
  }
}
