import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/checkout_table.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CheckOutTable(),
          const Divider(
            thickness: 2,
            color: AppColors.blue,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الاجمالي"),
              Text("80 نقطه"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.cartItems);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.mainOrange),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    child: const Text("اتمام الشراء"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.grey),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: const Text("الغاء الطلب"),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
