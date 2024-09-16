import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/core/widgets/custom_app_bar.dart';
import 'package:orange_bay/features/transactions_history/presentation/views/widgets/admin_transactions_history_body.dart';

class AdminTransactionsHistoryView extends StatelessWidget {
  const AdminTransactionsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 40, left: 16),
              child: Image.asset(
                AssetData.logo,
                height: 35,
              ),
            ),
            const CustomAppBar(text: 'سجل التعاملات'),
            const Expanded(child: AdminTransactionsHistoryBody.adminTransactionHistory()),
          ],
        ),
      ),
    );
  }
}

