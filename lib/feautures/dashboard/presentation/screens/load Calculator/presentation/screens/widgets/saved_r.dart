import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class SavedR extends StatelessWidget {
  const SavedR({
    super.key,  this.title,  this.subTitle,
  });

  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 14.0.h),
      decoration: BoxDecoration(
        color: Color(0xffFDF2EA),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: MText(
              inputText: title ?? "Battery",
              weight: FontWeight.w600,
              size: 12.spMin,
              textColor: AppColors.textColor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 2.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: MText(
              inputText: subTitle ?? "250Ah/24V",
              textColor: AppColors.primary,
              weight: FontWeight.w700,
              size: 16.spMin,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}