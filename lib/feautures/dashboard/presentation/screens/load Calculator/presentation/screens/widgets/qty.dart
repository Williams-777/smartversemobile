import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class QTY extends StatelessWidget {
  const QTY({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      width: double.infinity,
      height: 39.h,
      decoration: BoxDecoration(
        color: AppColors.calculatedBg,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: MText(
              inputText: "APPLIANCE",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
            ),
          ),
          Expanded(
            flex: 2,
            child: MText(
              inputText: "QTY",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
            ),
          ),
          Expanded(
            flex: 2,
            child: MText(
              inputText: "WATTS",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
            ),
          ),
          Expanded(
            flex: 2,
            child: MText(
              inputText: "DAILY",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
            ),
          ),
        ],
      ),
    );
  }
}