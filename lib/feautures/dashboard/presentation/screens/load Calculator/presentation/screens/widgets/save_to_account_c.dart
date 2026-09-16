import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class SaveToAccountC extends StatelessWidget {
  const SaveToAccountC({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
      width: 393.w,
      decoration: BoxDecoration(
        color: AppColors.main,
      ),
      child: Center(
        child: Column(
          children: [
            AppButton(
              title: "Save To Account",
              onTap: () {},
            ),

            SizedBox(height: 8.h),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 365.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.appliancestext2,
                    width: 1.w,
                  ),
                ),
                child: Center(
                  child: MText(
                    inputText: "↺ Start a new calculation",
                    size: 18.sp,
                    weight: FontWeight.w600,
                    textColor: Color(0XFF9E9E9E),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}