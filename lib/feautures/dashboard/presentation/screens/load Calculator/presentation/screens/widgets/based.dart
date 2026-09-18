import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/m_text.dart';

class Based extends StatelessWidget {
  final String? message;

  const Based({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final String resolvedMessage =
    (message == null || message!.trim().isEmpty)
        ? "\u201cBased on the appliances you selected, we recommend a 3 kVA inverter, a 250Ah/24V battery bank, and 4 × 450W solar panels\u201d."
        : message!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      width: 326.w,
      height: 77.h,
      decoration: BoxDecoration(
        color: const Color(0xffFDF2EA),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.spMin, color: const Color(0x140B1A33)),
      ),
      child: MText(
        textAlign: TextAlign.left,
        inputText: resolvedMessage,

        size: 11.spMin,
        weight: FontWeight.w400,
        textColor: const Color(0xff3C485C),
      ),
    );
  }
}