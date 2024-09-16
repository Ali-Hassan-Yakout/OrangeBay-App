import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final IconData? icon;
  final Color? iconColor;
  final String? errorText;
  final bool isPassword;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.errorText,
    this.isPassword = false,
    this.iconColor,
    this.label,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h), // Adjust vertical padding
      child: TextFormField(
        readOnly: readOnly,
        obscureText: isPassword,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          focusColor: AppColors.mainOrange,
          fillColor: AppColors.mainOrange,
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          // Adjust vertical padding
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ), // Adjust border radius
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blue),
            borderRadius:
                BorderRadius.all(Radius.circular(10.r)), // Adjust border radius
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius:
                BorderRadius.all(Radius.circular(10.r)), // Adjust border radius
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius:
                BorderRadius.all(Radius.circular(10.r)), // Adjust border radius
          ),
        ),
      ),
    );
  }
}
