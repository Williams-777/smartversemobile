import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class BasedOnMicrowaveContainer extends StatelessWidget {
  final String? message;

  const BasedOnMicrowaveContainer({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final String resolvedMessage =
    (message == null || message!.trim().isEmpty)
        ? "Based on your Microwave, Electric kettle, and Blender usage, we recommend a 3 kVA inverter, a 250Ah/24V battery bank, and 4 × 450W solar panels."
        : message!;

    return Container(
      width: double.infinity,
      height: 104.h,
      padding: EdgeInsets.symmetric(
          horizontal: 7.5.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.powermode2,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: MText(
        inputText: resolvedMessage,
        textColor: AppColors.appliancestext,
        size: 12.spMin,
        weight: FontWeight.w600,
        textAlign: TextAlign.left,
      ),
    );
  }
}