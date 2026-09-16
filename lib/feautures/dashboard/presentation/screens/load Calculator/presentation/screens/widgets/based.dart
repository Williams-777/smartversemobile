import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/m_text.dart';

class Based extends StatelessWidget {
  const Based({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      width: 326.w,
      height: 77.h,
      decoration: BoxDecoration(
        color: Color(0xffFDF2EA),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.spMin, color: Color(0x140B1A33)),
      ),
      child: MText( textAlign: TextAlign.left, inputText: "“Based on the appliances you selected, we recommend a 3 kVA inverter, a 250Ah/24V battery bank, and 4 × 450W solar panels”.", size: 11.spMin, weight: FontWeight.w400, textColor: Color(0xff3C485C),),
    );
  }
}