import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class RunningTotalBanner extends StatelessWidget {
  const RunningTotalBanner({super.key, required this.formattedLoad, required this.totalItems});

  final String formattedLoad;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.8.h),
      decoration: BoxDecoration(color: Color(0xffFDF2EA), borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText(inputText: "RUNNING TOTAL", textColor: Color(0xff545454), weight: FontWeight.w600, size: 11.spMin),
              SizedBox(height: 6.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  MText(inputText: formattedLoad, textColor: AppColors.primary, weight: FontWeight.w900, size: 32.spMin),
                  SizedBox(width: 6.w),
                  MText(inputText: "running load", textColor: Color(0xff545454), weight: FontWeight.w400, size: 12.spMin),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(color:  Color(0x26E87A2D), borderRadius: BorderRadius.circular(20.r)),
                child: MText(inputText: "$totalItems items", textColor: AppColors.primary, weight: FontWeight.w700, size: 12.spMin),
              ),
              SizedBox(height: 2.h),
              MText(inputText: "selected", textColor: Color(0xff575757), weight: FontWeight.w400, size: 11.spMin),
            ],
          ),
        ],
      ),
    );
  }
}