import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/app_button.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class EmptySavedProfiles extends StatelessWidget {
  final VoidCallback onCalculateNow;

  const EmptySavedProfiles({super.key, required this.onCalculateNow});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        MText(
          inputText: "No saved profiles yet",
          size: 24.spMin,
          weight: FontWeight.w700,
          textColor: AppColors.appliancestext,
        ),
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: MText(
            inputText: "Run a calculation and save it to build your profile library.",
            size: 14.spMin,
            weight: FontWeight.w400,
            textColor: Color(0xff7A9AB8),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Container(
            width: 365.w,
            padding: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              color: AppColors.main,
              border: Border(
                top: BorderSide(width: 0.97.w, color: Color(0x0F0B1A33)),
              ),
            ),
            child: Center(
              child: AppButton(
                title: "Calculate Now",
                onTap: onCalculateNow,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
