import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/m_text.dart';

class SurgeSC extends StatelessWidget {
  const SurgeSC({super.key, required this.peakSurgeKw});

  final double peakSurgeKw;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.4.w,
      height: 106.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xffFDF2EA),
        border: Border.all(color: const Color(0x80E87A2D), width: 1.1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText(inputText: "Surge-sensitive appliances detected", textColor: const Color(0xffA55720), size: 12.spMin, weight: FontWeight.w700),
            SizedBox(height: 4.h),
            MText(
              textAlign: TextAlign.left,
              inputText: "Some of your appliances need extra power when they switch on. Your ${peakSurgeKw.toStringAsFixed(1)} kW peak surge has been factored into your inverter recommendation.",
              size: 11.spMin,
              weight: FontWeight.w400,
              textColor: const Color(0xff333333),
            ),
          ],
        ),
      ),
    );
  }
}
