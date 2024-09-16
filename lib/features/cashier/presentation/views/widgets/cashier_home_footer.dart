import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/checkout_bottom_sheet.dart';

class CashierHomeFooter extends StatelessWidget {
  final int cartItemsCount;

  const CashierHomeFooter({
    super.key,
    required this.cartItemsCount,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mainOrange,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$cartItemsCount منتج  ، اجمالي ${cartItemsCount * 10} نقطه ',
            style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          // Text('$cartItemsCount Items , Total : ${cartItemsCount*10} Points',style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,),),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const CheckoutBottomSheet(),
              );
              //  GoRouter.of(context).push(AppRouter.cartItems)
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
