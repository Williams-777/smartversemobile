import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../../core/widgets/m_text.dart';
import 'result_bottom_sheet.dart';

class SaveAndShareC extends StatelessWidget {
  final VoidCallback? onSaveAndShare;
  final VoidCallback? onShowMaths;

  final String saveButtonTitle;
  final String showMathsTitle;
  final Color? showMathsTextColor;
  final Widget? bottomSheetContent;

  const SaveAndShareC({
    super.key,
    this.onSaveAndShare,
    this.onShowMaths,
    this.saveButtonTitle = " Save & Share result",
    this.showMathsTitle = "Show the maths",
    this.showMathsTextColor,
    this.bottomSheetContent,
  });

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
              title: saveButtonTitle,

              onTap: () {
                if (onSaveAndShare != null) {
                  onSaveAndShare!();
                }
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return bottomSheetContent ?? SaveResultBottomSheet();
                  },
                );
              },
            ),

            SizedBox(height: 8.h),
            InkWell(
              onTap: onShowMaths,
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
                    inputText: showMathsTitle,

                    size: 18.sp,
                    weight: FontWeight.w600,
                    textColor: showMathsTextColor ?? AppColors.textColor,
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