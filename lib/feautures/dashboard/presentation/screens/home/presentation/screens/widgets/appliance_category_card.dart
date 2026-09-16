import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class ApplianceCategoryCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final int addedCount;

  const ApplianceCategoryCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    this.addedCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final hasItems = addedCount > 0;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.appliancesContainer,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: hasItems ? AppColors.primary : const Color(0x1A2D5A9E),
          width: hasItems ? 1.5.w : 1.1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(imageAsset, fit: BoxFit.contain),
            ),
            SizedBox(height: 4.h),
            MText(
              inputText: title,
              textColor: AppColors.appliancestext,
              weight: FontWeight.w700,
              size: 14.spMin,
              family: "Montserrat",
            ),
            SizedBox(height: 2.h),
            MText(
              inputText: subtitle,
              textColor: AppColors.appliancestext2,
              weight: FontWeight.w400,
              size: 12.spMin,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (hasItems) ...[
              SizedBox(height: 3.h),
              MText(inputText: "$addedCount added", textColor: AppColors.primary, weight: FontWeight.w700, size: 11.spMin),
            ],
          ],
        ),
      ),
    );
  }
}