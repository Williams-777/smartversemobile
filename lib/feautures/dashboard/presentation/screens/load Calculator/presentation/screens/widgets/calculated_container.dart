import 'package:smartversemobile/app/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/m_text.dart';

class CalculatedContainer extends StatelessWidget {
  final String? assetImagePath;
  final String? label;
  final Color? borderColor;
  final double? borderWidth;
  final String kva;

  const CalculatedContainer({
    super.key,
    this.assetImagePath,
    this.label,
    this.borderColor,
    this.borderWidth,
    this.kva = "3",
  });

  @override
  Widget build(BuildContext context) {
    final String resolvedImagePath =
    (assetImagePath == null || assetImagePath!.trim().isEmpty)
        ? 'assets/images/☀️.png'
        : assetImagePath!;
    final String resolvedLabel =
    (label == null || label!.trim().isEmpty) ? 'Off-grid solar' : label!;
    final Color resolvedBorderColor =
        borderColor ?? AppColors.primary.withOpacity(0.5);
    final double resolvedBorderWidth = borderWidth ?? 1.53;


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(44.r),
          topRight: Radius.circular(44.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 43.93.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x261D7A4E),
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(
                      color: const Color(0x571D7A4E),
                      width: 1.5,
                    ),
                  ),
                  child: Row(

                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF34C759),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      MText(
                        inputText: "CALCULATED",
                        size: 12.sp,
                        weight: FontWeight.w700,
                        textColor: const Color(0xff34C759),
                        family: "DM Sans",
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 13.sp,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 4.w),

                      MText(
                        inputText: "Adjust",
                        size: 13.sp,
                        weight: FontWeight.w400,
                        textColor: AppColors.textColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            MText(
              inputText: "Recommended inverter",
              size: 13.sp,
              textColor: AppColors.appliancestext,
              weight: FontWeight.w400,
            ),
            SizedBox(height: 9.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                MText(
                  inputText: kva,
                  size: 64.sp,
                  weight: FontWeight.w900,
                  textColor: AppColors.primary,
                ),
                SizedBox(width: 4.w),
                MText(
                  inputText: "kVA",

                  size: 20.sp,
                  weight: FontWeight.w700,
                  textColor: AppColors.appliancestext,
                ),
              ],
            ),
            SizedBox(height: 13.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  color: resolvedBorderColor,
                  width: resolvedBorderWidth,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    resolvedImagePath,
                    width: 14.w,
                    height: 14.h,
                  ),
                  SizedBox(width: 6.w),
                  MText(
                    inputText: resolvedLabel,
                    size: 13.sp,
                    weight: FontWeight.w600,
                    textColor: AppColors.appliancestext,
                    family: "DM Sans",

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}