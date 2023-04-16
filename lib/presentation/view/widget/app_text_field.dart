import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_color.dart';

class AppTextField extends StatelessWidget {
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final String? errorText;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onPressed;
  final EdgeInsetsGeometry? contentPadding;

  const AppTextField({
    Key? key,
    this.maxLength,
    this.maxLines,
    this.hintText,
    this.errorText,
    this.textEditingController,
    this.onChanged,
    this.keyboardType,
    this.readOnly,
    this.onPressed,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly ?? false,
      onTap: onPressed,
      controller: textEditingController,
      maxLength: maxLength,
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: 18.0.sp,
        color: AppColor.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.white,
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(vertical: 16.0.sp, horizontal: 20.0.sp),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.white),
          borderRadius: BorderRadius.circular(12.0.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.white),
          borderRadius: BorderRadius.circular(12.0.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(12.0.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(12.0.sp),
        ),
        counter: const SizedBox.shrink(),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.0.sp,
          color: AppColor.grayText,
          fontWeight: FontWeight.w400,
        ),
        errorText: (errorText ?? '').isEmpty ? null : errorText,
        errorStyle: TextStyle(
          fontSize: 14.0.sp,
          color: Colors.redAccent,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
