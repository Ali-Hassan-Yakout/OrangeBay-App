import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? enabledColor, fillColor, hintColor, focusColor, controllerColor;
  final double? tPadding, hintSize, bPadding;
  final double? borderRadius;
  final TextInputType? type;
  final Function()? onTap;
  final dynamic Function(dynamic)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool? isPassword;
  final int? maxLine, hintMaxLine;
  final String? Function(String?)? validate;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final Function()? suffixPressed;
  final bool? isClickable;
  final bool? autocorrect, isFill;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? enabled;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.borderRadius,
    this.maxLine,
    this.textAlign,
    this.controller,
    this.type,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.textStyle,
    this.isPassword,
    this.validate,
    this.hint,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable,
    this.autocorrect,
    this.focusColor,
    this.enabledColor,
    this.tPadding,
    this.enabled,
    this.isFill,
    this.inputFormatters,
    this.fillColor,
    this.hintColor,
    this.hintSize,
    this.bPadding,
    this.onEditingComplete,
    this.controllerColor,
    this.hintMaxLine,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      cursorColor: AppColors.primary,
      style: TextStyle(
          color: controllerColor ?? Colors.black,
          fontSize: 18.sp,
          fontWeight: fontWeight ?? FontWeight.w400),
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        errorMaxLines: 5,
        filled: isFill ?? true,
        fillColor: fillColor ?? Colors.white,
        errorStyle: TextStyle(fontSize: 14.sp, color: AppColors.errorColor),
        contentPadding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: tPadding ?? 10.h,
            bottom: bPadding ?? 10.h),
        focusedBorder: (enabled == true)
            ? UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusColor ?? AppColors.mainOrange,
          ),
        )
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
          borderSide: BorderSide(
            color: focusColor ?? AppColors.mainOrange,
          ),
        ),
        enabledBorder: (enabled == true)
            ? UnderlineInputBorder(
          borderSide: BorderSide(
            color: enabledColor ?? AppColors.mainOrange,
          ),
        )
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
          borderSide: BorderSide(
            color: enabledColor ?? AppColors.mainOrange,
          ),
        ),
        border: (enabled == true)
            ? const UnderlineInputBorder(
          borderSide: BorderSide(),
        )
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
          borderSide: const BorderSide(),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
          borderSide: const BorderSide(color: AppColors.errorColor),
        ),
        hintText: hint,
        hintMaxLines: hintMaxLine ?? 500,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: hintSize ?? 16.sp,
          color: hintColor ?? AppColors.grey,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      controller: controller,
      keyboardType: type,
      textInputAction: TextInputAction.next,
      obscureText: isPassword ?? false,
      enabled: isClickable ?? true,
      focusNode: focusNode,
      onTap: onTap,
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      maxLines: maxLine,
      inputFormatters: inputFormatters,
    );
  }
}