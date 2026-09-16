import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class SavedProfileCard extends StatelessWidget {
  final String title;
  final String date;
  final String kvaValue;
  final String itemsCount;
  final String loadValue;
  final String batteryValue;
  final String solarValue;
  final String modeText;
  final VoidCallback onDelete;
  final VoidCallback onOpen;

  const SavedProfileCard({
    super.key,
    required this.title,
    required this.date,
    required this.kvaValue,
    required this.itemsCount,
    required this.loadValue,
    required this.batteryValue,
    required this.solarValue,
    required this.modeText,
    required this.onDelete,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16.r),
        border: Border(
          top: BorderSide(color: AppColors.primary, width: 2.spMin),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(
                    inputText: title,
                    size: 16.spMin,
                    weight: FontWeight.w700,
                    textColor: AppColors.appliancestext,
                  ),
                  SizedBox(height: 4.h),
                  MText(
                    inputText: "Saved $date",
                    size: 12.spMin,
                    weight: FontWeight.w400,
                    textColor: AppColors.searchtext,
                  ),
                ],
              ),
              Column(
                children: [
                  MText(
                    inputText: kvaValue,
                    size: 30.spMin,
                    weight: FontWeight.w700,
                    textColor: AppColors.primary,
                  ),
                  MText(
                    inputText: "kVA",
                    size: 10.spMin,
                    weight: FontWeight.w400,
                    textColor: Color(0xff545454)
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildInfoItem(itemsCount, "Items"),
              SizedBox(width: 8.w),
              _buildInfoItem(loadValue, "Load"),
              SizedBox(width: 8.w),
              _buildInfoItem(batteryValue, "Battery"),
              SizedBox(width: 8.w),
              _buildInfoItem(solarValue, "Solar"),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Color(0x0D1D7A4E),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.usagePatternContainerText.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/☀️.png", width: 11, height: 11,),
                    SizedBox(width: 4.w),
                    MText(
                      inputText: modeText,
                      size: 11.spMin,
                      weight: FontWeight.w600,
                      textColor: AppColors.usagePatternContainerText,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color:Color(0x0DE87A2D),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Color(0x33E87A2D), width: 1.spMin),
                      ),
                      child: MText(
                        inputText: "Delete",
                        size: 14.spMin,
                        weight: FontWeight.w600,
                        textColor: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: onOpen,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color:Color(0x802D5A9E),),
                      ),
                      child: Row(
                        children: [
                          MText(
                            inputText: "Open",
                            size: 12.spMin,
                            weight: FontWeight.w700,
                            textColor: AppColors.appliancestext,
                          ),
                          SizedBox(width: 4.w),
                          Icon(Icons.arrow_forward, color: AppColors.appliancestext, size: 14.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: Color(0xffFDF2EA).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            MText(
              inputText: value,
              size: 13.spMin,
              weight: FontWeight.w700,
              textColor: AppColors.appliancestext,
            ),
            SizedBox(height: 2.h),
            MText(
              inputText: label,
              size: 9.spMin,
              weight: FontWeight.w400,
              textColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}


