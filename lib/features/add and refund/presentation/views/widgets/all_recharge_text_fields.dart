import 'package:flutter/material.dart';
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
              AppTextField(
                controller: cardNum,
                hint: '',
                isClickable: false,
              ),
            ],
          ),
          Column(
            children: [
              const CustomText(
                text: 'Current Balance',
              ),
              AppTextField(
                controller: currentBalance,
                hint: '',
                isClickable: false,
              ),
            ],
          ),
          Column(
            children: [
              const CustomText(
                text: 'Amount to be charged',
              ),
              AppTextField(
                controller: money,
                hint: 'Enter Amount',
                validate: (value) {
                  if(value!.isEmpty){
                    return 'Please Enter Amount';
                  }
                  return null;
                },
                type: TextInputType.number,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
