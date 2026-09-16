import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class HoursWithoutGridPower extends StatefulWidget {
  const HoursWithoutGridPower({super.key, this.initialHour = 6, this.onChanged});

  final int initialHour;
  final ValueChanged<int>? onChanged;

  @override
  State<HoursWithoutGridPower> createState() => _HoursWithoutGridPowerState();
}

class _HoursWithoutGridPowerState extends State<HoursWithoutGridPower> {
  late int selectedHour = widget.initialHour;
  final List<int> hours = [2, 4, 6, 8, 10, 12, 16, 20, 24];

  void _select(int hour) {
    setState(() => selectedHour = hour);
    widget.onChanged?.call(hour);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText(
            inputText: "HOURS WITHOUT GRID POWER",
            size: 14.spMin,
            weight: FontWeight.w700,
           textColor: AppColors.textColor3,
          ),
          SizedBox(height: 11.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MText(
                inputText: "$selectedHour",
                size: 72.spMin,
                weight: FontWeight.w900,
                textColor: AppColors.appliancestext,
               family: "Fraunces",
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, left: 8.w),
                child: MText(
                  inputText: "hrs/day",
                  size: 22.spMin,
                  weight: FontWeight.w400,
                  textColor: AppColors.textColor3,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          Container(
            height: 6.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.appliancesC.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: selectedHour,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                Expanded(
                  flex: 24 - selectedHour,
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            alignment: WrapAlignment.start,
            children: hours.map((hour) {
              bool isSelected = selectedHour == hour;
              return GestureDetector(
                onTap: () => _select(hour),
                child: Container(
                  width: 45.w,
                  height: 36.17.h,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.usagePatternContainer2,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : const Color(0xFFE2E0DE),
                      width: 1.1.w,
                    ),
                  ),
                  child: Center(
                    child: MText(
                      inputText: "${hour}h",
                      size: 14.spMin,
                      weight: FontWeight.w600,
                      textColor: isSelected ? AppColors.main : AppColors.appliancestext2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
