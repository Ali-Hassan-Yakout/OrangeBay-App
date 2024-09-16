import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/custom_text.dart';

class AllTextFields extends StatelessWidget {
  final String uid;

  const AllTextFields({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController userName = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController nationality = TextEditingController();
    final TextEditingController money = TextEditingController();

    return Column(
      children: [
        Column(
          children: [
            const CustomText(
              text: 'Name',
            ),
            CustomTextField(
              controller: userName,
              hint: 'Enter Name',
              icon: Icons.person,
              iconColor: AppColors.blue,
              errorText: 'Please Enter Visitor Name',
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Column(
          children: [
            const CustomText(
              text: 'Phone',
            ),
            CustomTextField(
              controller: phone,
              hint: 'Enter Phone',
              icon: Icons.phone,
              iconColor: AppColors.blue,
              errorText: 'Please Enter Visitor Phone',
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Column(
          children: [
            const CustomText(
              text: 'Nationality',
            ),
            CustomTextField(
              controller: nationality,
              hint: 'Enter Nationality',
              icon: Icons.place,
              iconColor: AppColors.blue,
              errorText: 'Please Enter Visitor Nationality',
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Column(
          children: [
            const CustomText(
              text: 'Balance',
            ),
            CustomTextField(
              controller: money,
              hint: 'Enter Amount',
              icon: FontAwesomeIcons.dollarSign,
              iconColor: AppColors.blue,
              errorText: 'Please Enter Amount',
            ),
          ],
        ),
      ],
    );
  }
}
