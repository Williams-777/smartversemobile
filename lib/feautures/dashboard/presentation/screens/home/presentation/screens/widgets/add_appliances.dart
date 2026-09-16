import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class AddAppliances extends StatelessWidget {
  final bool hasSelection;
  final VoidCallback? onTap;

  const AddAppliances({
    super.key,
    this.hasSelection = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.51.h, horizontal: 14.w),
      width: 390.w,
      height: 112.h,
      decoration: BoxDecoration(
        color: AppColors.main,
      ),
      child: Center(
        child: GestureDetector(
          onTap: hasSelection ? onTap : null,
          child: Container(
            width: 363.w,
            height: 54.h,
            decoration: BoxDecoration(

              color: hasSelection ? AppColors.surgeText : AppColors.appliancesC,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: MText(
                inputText: hasSelection ? "Continue" : "Add appliances to continue",
                weight: FontWeight.w600,
                size: 18.spMin,
                textColor: hasSelection ? Colors.white : AppColors.appliancesCText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}