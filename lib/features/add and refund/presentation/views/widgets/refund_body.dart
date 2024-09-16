import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/widgets/custom_app_bar.dart';
import 'package:orange_bay/core/widgets/custom_button.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/custom_text.dart';

class RefundBody extends StatelessWidget {
  const RefundBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNum = TextEditingController();
    final TextEditingController currentBalance = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40.h,
        horizontal: 16.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(text: 'Refund'),
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
            SizedBox(
              height: 20.h,
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
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Successful refund',
                  btnOkOnPress: () {
                    GoRouter.of(context).pushReplacement(AppRouter.admin);
                  },
                  btnOkText: 'OK',
                ).show();
              },
              backgroundColor: AppColors.mainOrange,
              text: 'Refund All',
              textColor: Colors.white,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              backgroundColor: AppColors.grey,
              text: 'Cancel',
              textColor: Colors.white,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.admin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
