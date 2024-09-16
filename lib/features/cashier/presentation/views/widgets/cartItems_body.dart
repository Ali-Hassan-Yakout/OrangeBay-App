import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/receit_container.dart';

class CartItemsBody extends StatelessWidget {
  const CartItemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height * .35,
            child: const ReceiptContainer(),
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).pushReplacement(AppRouter.verifyPayment),
                GoRouter.of(context).pop();
                GoRouter.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                textStyle: WidgetStatePropertyAll(
                  textTheme.headlineSmall,
                ),
                backgroundColor:
                    const WidgetStatePropertyAll(AppColors.mainOrange),
              ),
              child: const Text("طباعة"),
            ),
          ),
        ],
      ),
    );
  }
}
