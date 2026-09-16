import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class UsageInfoCard extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;

  const UsageInfoCard({
    super.key,
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.33.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.usageC,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MText(
            inputText: value,
            weight: FontWeight.w700,
            size: 20.spMin,
            textColor: valueColor,
          ),
          SizedBox(height: 4.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: MText(
              inputText: label,
              weight: FontWeight.w600,
              size: 13.spMin,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}