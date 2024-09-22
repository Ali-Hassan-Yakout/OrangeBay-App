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
            AppTextField(
              controller: userName,
              hint: 'Enter Name',
              suffix: const Icon(
                Icons.person,
                color: AppColors.blue,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Visitor Name';
                }
                return null;
              },
              type: TextInputType.name,
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
            AppTextField(
              controller: phone,
              hint: 'Enter Phone',
              suffix: const Icon(
                Icons.phone,
                color: AppColors.blue,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Visitor Phone';
                }
                return null;
              },
              type: TextInputType.phone,
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
            AppTextField(
              controller: nationality,
              hint: 'Enter Nationality',
              suffix: const Icon(
                Icons.place,
                color: AppColors.blue,
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Visitor Nationality';
                }
                return null;
              },
              type: TextInputType.text,
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
            AppTextField(
              controller: money,
              hint: 'Enter Amount',
              suffix: const Icon(
                FontAwesomeIcons.dollarSign,
                color: AppColors.blue,
              ),
              validate:(value) {
                if (value!.isEmpty) {
                  return 'Please Enter Amount';
                }
                return null;
              },
              type: TextInputType.number,
            ),
          ],
        ),
      ],
    );
  }
}
