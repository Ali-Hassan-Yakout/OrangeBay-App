import 'package:flutter/material.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/custom_text.dart';

class AllCardIfonTextFields extends StatelessWidget {
  const AllCardIfonTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userName = TextEditingController();
    final TextEditingController nationality = TextEditingController();
    final TextEditingController ticketNum = TextEditingController();
    final TextEditingController guidName = TextEditingController();
    final TextEditingController cardHistory = TextEditingController();
    final TextEditingController currentBalance = TextEditingController();

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const CustomText(
                  text: 'Name',
                ),
                CustomTextField(
                  controller: userName,
                  hint: '',
                  iconColor: AppColors.blue,
                  readOnly: true,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                const CustomText(
                  text: 'Nationality',
                ),
                CustomTextField(
                  controller: nationality,
                  hint: '',
                  iconColor: AppColors.blue,
                  readOnly: true,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                const CustomText(
                  text: 'Ticket Number',
                ),
                CustomTextField(
                  controller: ticketNum,
                  hint: '',
                  iconColor: AppColors.blue,
                  readOnly: true,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                const CustomText(
                  text: 'Tour Guide Name',
                ),
                CustomTextField(
                  controller: guidName,
                  hint: '',
                  iconColor: AppColors.blue,
                  readOnly: true,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            // const CurrencyDropDown(),

            Column(
              children: [
                const CustomText(
                  text: 'Card Release Date',
                ),
                CustomTextField(
                  controller: cardHistory,
                  hint: '',
                  iconColor: AppColors.blue,
                  readOnly: true,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
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
          ],
        ),
      ),
    );
  }
}
