import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';
class MicrowaveX extends StatelessWidget {
  const MicrowaveX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 114.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xffFDFDFE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MText(inputText: "Microwave ×1", size: 12.spMin, weight: FontWeight.w400, textColor: AppColors.appliancestext,),
              Spacer(),
              MText(inputText: "600W", size: 11.spMin, weight: FontWeight.w700, textColor: AppColors.appliancestext2, ),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              MText(inputText: "Electric Kettle ×1", size: 12.spMin, weight: FontWeight.w400, textColor: AppColors.appliancestext,),
              Spacer(),
              MText(inputText: "200W", size: 11.spMin, weight: FontWeight.w700, textColor: AppColors.appliancestext2, ),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              MText(inputText: "Blender ×1", size: 12.spMin, weight: FontWeight.w400, textColor: AppColors.appliancestext,),
              Spacer(),
              MText(inputText: "400W", size: 11.spMin, weight: FontWeight.w700, textColor: AppColors.appliancestext2, ),
            ],
          ),
        ],
      ),
    );
  }
}