import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/app_button.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class SaveResultBottomSheet extends StatelessWidget {
  const SaveResultBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(64.r),
          topRight: Radius.circular(64.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Color(0x14000000),
                    border: Border.all(color: Color(0x33000000)),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 18.sp,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            MText(
              inputText: "Save your result",
              size: 24.sp,
              weight: FontWeight.w700,
              textColor: AppColors.appliancestext,
            ),
            SizedBox(height: 2.h),
            MText(
              inputText: "A free account is required",
              size: 13.sp,
              weight: FontWeight.w400,
              textColor: Color(0xff333333)
            ),
            SizedBox(height: 24.h),
            AppButton(
              title: "Create Account",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/create_account');
              },
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: double.infinity,
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
                    inputText: "Sign In",
                    size: 18.sp,
                    weight: FontWeight.w600,
                    textColor: AppColors.textColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 22.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: MText(
                inputText: "Maybe later",
                size: 14.sp,
                weight: FontWeight.w500,
                textColor: AppColors.searchtext,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
