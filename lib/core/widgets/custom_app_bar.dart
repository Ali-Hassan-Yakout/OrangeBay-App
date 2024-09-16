import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
                side: BorderSide(
                  width: 8.w,
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0xffFFFFFF)),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20.r,
          ),
          onPressed: () {
            GoRouter.of(context)
                .pushReplacement(AppRouter.admin); // Handle navigation back
          },
        ),
        const Spacer(),
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 30.sp,
          ),
        ),
      ],
    );
  }
}
