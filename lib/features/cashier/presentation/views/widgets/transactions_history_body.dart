import 'package:flutter/material.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/receit_container.dart';

class TransactionsHistoryBody extends StatelessWidget {
  const TransactionsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: ReceiptContainer(),
    );
  }
}
