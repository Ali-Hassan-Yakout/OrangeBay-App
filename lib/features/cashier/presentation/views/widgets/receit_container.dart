import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class ReceiptContainer extends StatelessWidget {
  const ReceiptContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> labels = [
      'نقطه البيع',
      'اسم المستخدم',
      'بيبسي',
      'ريدبول',
      'شيبسي',
      'اجمالي النقاط',
      'النقاط المتبقيه'
    ];
    List<String> itemsCount = ['', '', '2*10', '3*10', '3*10', '', ''];
    List<String> itemsTotal = [
      '1',
      'Ahmed',
      '20 نقطه',
      '30 نقطه',
      '30 نقطه',
      '80',
      '120'
    ];
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labels[index],
            style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            itemsCount[index],
            style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            itemsTotal[index],
            style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.blue,
      ),
      itemCount: labels.length,
    );
  }
}
