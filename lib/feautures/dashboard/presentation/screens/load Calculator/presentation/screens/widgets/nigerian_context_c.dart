import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

import '../../../../../../../../app/theme/app_colors.dart';

class NigerianContextC extends StatelessWidget {
  const NigerianContextC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.19.w,
      height: 117.19.h,
      decoration: BoxDecoration(
          color: AppColors.usagePatternContainer,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1.1.w, color: Color(0x402D5A9E),
          )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText(inputText: "💡 Nigerian context",size: 14.spMin, weight: FontWeight.w600, textColor: AppColors.appliancestext2,),
            SizedBox(height: 4.h,),
            MText(inputText: "Most urban homes experience 6–10 hours of grid outages daily. For off-grid solar, we use 4.5 peak sun hours/day for sizing.", size: 12.spMin,weight: FontWeight.w400, textColor: AppColors.appliancestext2,textAlign: TextAlign.left,),

          ],
        ),
      ),
    );
  }
}

