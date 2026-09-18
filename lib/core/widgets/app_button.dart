import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/app_colors.dart';
import 'm_text.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key, this.width, this.height, this.title, this.child, this.onTap,
  });

  final double? width;
  final double? height;
  final String? title;
  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?? double.infinity,
        height: height?? 58.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: child ??
              MText(

                inputText: title?? "Continue",
                size: 18.spMin,
                weight: .w600,
                textColor: AppColors.main,
                family: "Inter",
              ),
        ),
      ),
    );
  }
}