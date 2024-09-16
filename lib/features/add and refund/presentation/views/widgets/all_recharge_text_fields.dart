import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/custom_text.dart';

class AllRechargeTextFields extends StatelessWidget {
  const AllRechargeTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNum = TextEditingController();
    final TextEditingController currentBalance = TextEditingController();
    final TextEditingController money = TextEditingController();

    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              const CustomText(
                text: 'Card Number',
              ),
              CustomTextField(
                controller: cardNum,
                hint: '',
                iconColor: AppColors.blue,
                readOnly: true,
              ),
            ],
          ),
          Column(
            children: [
              const CustomText(
                text: 'Current Balance',
              ),
              CustomTextField(
                controller: currentBalance,
                hint: '',
                iconColor: AppColors.blue,
                readOnly: true,
              ),
            ],
          ),
          Column(
            children: [
              const CustomText(
                text: 'Amount to be charged',
              ),
              CustomTextField(
                controller: money,
                hint: 'Enter Amount',
                iconColor: AppColors.blue,
                errorText: 'Please Enter Amount',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
