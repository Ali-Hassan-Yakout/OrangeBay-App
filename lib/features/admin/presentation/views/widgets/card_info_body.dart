import 'package:flutter/material.dart';
import 'package:orange_bay/core/widgets/custom_app_bar.dart';
import 'package:orange_bay/features/admin/presentation/views/widgets/all_card_info_text_fields.dart';

class CardInfoBody extends StatelessWidget {
  const CardInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Card Inquiry',
          ),
          SizedBox(
            height: 20,
          ),
          AllCardIfonTextFields()
        ],
      ),
    );
  }
}
