import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/cartItems_body.dart';

class CartItemsView extends StatelessWidget {
  const CartItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.greyBg,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetData.logo,
              height: 40,
            ),
          )
        ],
      ),
      backgroundColor: AppColors.greyBg,
      body: const CartItemsBody(),
    );
  }
}
