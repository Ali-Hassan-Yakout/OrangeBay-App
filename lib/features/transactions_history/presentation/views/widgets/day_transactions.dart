import 'package:flutter/material.dart';

class DayTransactionsItem extends StatelessWidget {
  final String label;
  final List<String> transactions;
  const DayTransactionsItem({Key? key, required this.label, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical :6.0),
          child: Text(label,textAlign: TextAlign.start,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
        ),
        ListView.separated(shrinkWrap: true,physics:const NeverScrollableScrollPhysics(),itemBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(transactions[index]),
        ), separatorBuilder: (context,index)=>const Divider(), itemCount: transactions.length),
      ],
    );
  }
}
