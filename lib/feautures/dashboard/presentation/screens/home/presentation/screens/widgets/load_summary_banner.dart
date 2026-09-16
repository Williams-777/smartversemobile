import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class LoadSummaryBanner extends StatelessWidget {
  const LoadSummaryBanner({super.key, required this.formattedLoad, required this.totalItems});

  final String formattedLoad;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xffFDF2EA),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText(inputText: "Load so far", textColor: AppColors.kitchenCalc, weight: FontWeight.w500, size: 11.spMin),
              MText(inputText: formattedLoad, textColor: AppColors.surgeText, weight: FontWeight.w900, size: 24.spMin),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              MText(inputText: "Items", textColor: AppColors.kitchenCalc, weight: FontWeight.w400, size: 11.spMin),
              MText(inputText: "$totalItems", textColor: AppColors.textColor, weight: FontWeight.w900, size: 24.spMin),
            ],
          ),
        ],
      ),
    );
  }
}