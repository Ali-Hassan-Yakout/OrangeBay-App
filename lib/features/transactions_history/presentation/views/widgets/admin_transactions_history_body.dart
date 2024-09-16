import 'package:flutter/material.dart';
import 'package:orange_bay/features/transactions_history/presentation/views/widgets/day_transactions.dart';

class AdminTransactionsHistoryBody extends StatelessWidget {
  const AdminTransactionsHistoryBody.adminTransactionHistory({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemBuilder: (context, index) => DayTransactionsItem(
                label: index == 0 ? 'تعاملات اليوم' : 'تعاملات امس',
                transactions: const [
                  "تم شراء بيبسي بعشر نقاط",
                  "تم شحن الكارت بعشرين نقطة",
                  "تم شراء بيبسي بعشر نقاط",
                  "تم شحن الكارت بعشرين نقطة"
                ],
              ),
          separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
          itemCount: 2),
    );
  }
}
