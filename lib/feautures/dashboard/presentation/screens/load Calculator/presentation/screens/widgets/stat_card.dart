import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class StatCard extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String? value;
  final String? unit;
  final String subtitle;
  final Color? valueColor;
  final Color? unitColor;
  final Color? boderColor;
  final Color? dividerColor;
  final double? dividerWidth;
  final double? dividerHeight;

  const StatCard({
    super.key,
    required this.iconAsset,
    required this.title,
    this.value,
    this.unit,
    required this.subtitle,
    this.valueColor,
    this.unitColor,
    this.boderColor,
    this.dividerColor,
    this.dividerWidth,
    this.dividerHeight,
  });

  bool get _hasValue => value != null && value!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.51.h),
      decoration: BoxDecoration(
        color: AppColors.powermode2,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: boderColor ?? const Color(0xFFE4E9F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: const Color(0x142D5A9E),
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Image.asset(
              iconAsset,
              width: 18.sp,
              height: 18.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerLeft,
            child: MText(
              inputText: title,
              size: 13.sp,
              weight: FontWeight.w400,
              textColor: AppColors.textColor,
            ),
          ),
          SizedBox(height: 4.h),
          _hasValue
              ? RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: valueColor ?? const Color(0xFF276ABA),
                    fontFamily: 'Inter',
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: unitColor ?? const Color(0xFFB3D7F7),
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          )
              : Container(
            width: dividerWidth ?? 32.w,
            height: dividerHeight ?? 2.h,
            margin: EdgeInsets.symmetric(vertical: 11.h),
            decoration: BoxDecoration(
              color: dividerColor ?? const Color(0xFF276ABA),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: MText(
              inputText: subtitle,
              size: 13.sp,
              weight: FontWeight.w400,
              textColor: AppColors.textColor,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}