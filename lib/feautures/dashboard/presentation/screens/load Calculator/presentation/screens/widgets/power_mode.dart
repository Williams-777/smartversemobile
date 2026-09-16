import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class PowerModeC extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color? boderColor;
  final VoidCallback onTap;

  const PowerModeC({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.titleColor,
    required this.onTap,
    this.boderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 173.85.w,
        height: 199.h,
        decoration: BoxDecoration(
            color: AppColors.main,

            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
                color: boderColor ?? Color(0x400B1A33)
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 40.4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageAsset),
              SizedBox(height: 8.h,),
              MText(inputText: title, size: 14.spMin, weight: FontWeight.w700, textColor: titleColor,),
              SizedBox(height: 4.h,),
              MText(inputText: subtitle, size: 12.spMin, weight: FontWeight.w400, textAlign: TextAlign.left, textColor: Color(0xff333333),),
            ],
          ),
        ),
      ),
    );
  }
}