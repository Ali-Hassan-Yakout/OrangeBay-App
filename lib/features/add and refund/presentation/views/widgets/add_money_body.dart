import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/widgets/custom_app_bar.dart';
import 'package:orange_bay/core/widgets/custom_button.dart';
import 'package:orange_bay/features/add%20and%20refund/presentation/views/widgets/all_recharge_text_fields.dart';

class AddMoneyBody extends StatelessWidget {
  const AddMoneyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 15.w,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .8,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomAppBar(text: 'Recharge'),
              SizedBox(
                height: 22.h,
              ),
              const AllRechargeTextFields(),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                onPressed: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'Recharged Successfully',
                          btnOkOnPress: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.admin);
                          },
                          btnOkText: 'Ok')
                      .show();
                },
                backgroundColor: AppColors.mainOrange,
                text: 'Confirm',
                textColor: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.admin);
                },
                backgroundColor: AppColors.grey,
                text: 'Cancel',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
