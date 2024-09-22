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

class TourGuideProfitBody extends StatelessWidget {
  const TourGuideProfitBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 15.w,
      ),
      child: Column(
        children: [
          const CustomAppBar(text: 'Tour Guide Profit'),
          const SizedBox(
            height: 20,
          ),
          const CustomText(text: "Tour Guide Name"),
          AppTextField(
            controller: nameController,
            hint: 'Enter Name',
            validate: (value){
              if (value!.isEmpty){
                return "Please Enter Name";
              }
              return null;
            },
            type:  TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(text: "Tour Guide Phone"),
          AppTextField(
            controller: phoneController,
            hint: 'Enter Phone',
            validate: (value){
              if (value!.isEmpty){
                return "Please Enter Phone";
              }
              return null;
            },
            type:  TextInputType.phone,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            backgroundColor: AppColors.mainOrange,
            text: 'Confirm',
            textColor: Colors.white,
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'Card Replaced',
                btnOkOnPress: () {
                  GoRouter.of(context).pushReplacement(AppRouter.admin);
                },
                btnOkText: 'Ok',
              ).show();
            },
          ),
        ],
      ),
    );
  }
}
