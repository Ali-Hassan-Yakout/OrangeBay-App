import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/transactions_history_body.dart';

class TransactionsHistoryView extends StatelessWidget {
  const TransactionsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[200],
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios),onPressed: ()=>GoRouter.of(context).pop(),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetData.logo,height: 40,),
          )
        ],),
      backgroundColor: AppColors.greyBg,
      body: const TransactionsHistoryBody(),
    );
  }
}
