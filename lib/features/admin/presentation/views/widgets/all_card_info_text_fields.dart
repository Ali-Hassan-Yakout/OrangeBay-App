import 'package:flutter/material.dart';
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
                AppTextField(
                  controller: userName,
                  hint: '',
                  isClickable: false,
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
                AppTextField(
                  controller: nationality,
                  hint: '',
                  isClickable: false,
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
                AppTextField(
                  controller: ticketNum,
                  hint: '',
                  isClickable: false,
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
                AppTextField(
                  controller: guidName,
                  hint: '',
                  isClickable: false,
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
                AppTextField(
                  controller: cardHistory,
                  hint: '',
                  isClickable: false,
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
                AppTextField(
                  controller: currentBalance,
                  hint: '',
                  isClickable: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
