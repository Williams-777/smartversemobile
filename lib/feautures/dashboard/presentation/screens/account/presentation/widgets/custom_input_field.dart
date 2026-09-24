import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? subLabel;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.subLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: label, style: TextStyle(color: AppColors.appliancestext, fontSize: 16.sp, fontWeight: FontWeight.w400)),
              if (subLabel != null)
                TextSpan(text: ' $subLabel', style: TextStyle(color: AppColors.appliancestext, fontSize: 16.sp, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xff9E9E9E), fontSize: 14.sp, fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xff9E9E9E)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
