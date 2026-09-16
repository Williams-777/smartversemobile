import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class ActionOptionsCard extends StatelessWidget {
  const ActionOptionsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xff0B1A33).withOpacity(0.1),
          width: 1.22,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAEFF5),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Image.asset('assets/images/📄.png'),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      MText(
                        inputText: 'Download PDF',
                        weight: FontWeight.w700,
                        size: 16.spMin,
                        textColor: AppColors.textColor,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 2.h),
                      MText(
                        inputText: 'Professional report',
                        weight: FontWeight.w400,
                        size: 13.spMin,
                        textColor: AppColors.searchtext,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.addAppliancesrest,
                  size: 20.sp,
                ),
              ],
            ),
          ),


          Divider(
            height: 1,
            thickness: 1,

            color: const Color(0xff0B1A33).withOpacity(0.08),
          ),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAEFF5),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Image.asset('assets/images/💬.png'),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MText(
                        inputText: 'Share via WhatsApp',
                        weight: FontWeight.w700,
                        size: 16.spMin,
                        textColor: AppColors.textColor,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 2.h),
                      MText(

                        inputText: 'Send to installer',
                        weight: FontWeight.w400,
                        size: 13.spMin,
                        textColor: AppColors.searchtext,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.addAppliancesrest,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

