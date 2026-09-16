import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class ApplianceWattageRow extends StatelessWidget {
  const ApplianceWattageRow({super.key, required this.quantity, required this.wattage});

  final int quantity;
  final int wattage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      color: const Color(0x80EAEFF5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MText(inputText: "$quantity × ${wattage}W", textColor: AppColors.surgeText, weight: FontWeight.w500, size: 13.spMin),
          MText(inputText: "= ${quantity * wattage}W", textColor: AppColors.surgeText, weight: FontWeight.w700, size: 13.spMin),
        ],
      ),
    );
  }
}