import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class WalkthroughCard extends StatelessWidget {
  const WalkthroughCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: Color(0x59FDF2EA)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _WalkthroughStep(
            stepNumber: 1,
            title: "INVERTER SIZE",
            value: "3 kVA",
            mathTexts: const [
              "Peak surge: 1.8kW",
              "× 1.25 safety margin",
              "+ 0.8 power factor",
              "= 2.78 kVA → rounded up to 3 kVA",
            ],
          ),
          SizedBox(height: 24.h),
          _WalkthroughStep(
            stepNumber: 2,
            title: "DAILY ENERGY",
            value: "6.0kWh",
            mathTexts: const [
              "Σ (watts × qty × 6h/day) = 6.0kWh",
            ],
          ),
          SizedBox(height: 24.h),
          _WalkthroughStep(
            stepNumber: 3,
            title: "BATTERY",
            value: "250Ah/24V",
            mathTexts: const [
              "6.60kWh ÷ 24h × 12h backup",
              "÷ 0.6 (DoD limit)",
              "÷ 24V system",
              "= 250Ah (rounded to ×50)",
            ],
            description:
            "Depth of Discharge (DoD) at 60% protects battery lifespan. 24V chosen because inverter is < 3.5 kVA → 24V.",
          ),
          SizedBox(height: 24.h),
          _WalkthroughStep(
            stepNumber: 4,
            title: "SOLAR PANELS",
            value: "4 × 450W panels",
            mathTexts: const [
              "6.0kWh ÷ (4,500 Wh × 0.85 eff)",
              "= 1.2 kW → 4 panels of 450W",
            ],
            description:
            "4.5 peak sun hours/day, with 85% efficiency to account for system losses.",
          ),
        ],
      ),
    );
  }
}

class _WalkthroughStep extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String value;
  final List<String> mathTexts;
  final String? description;

  const _WalkthroughStep({
    required this.stepNumber,
    required this.title,
    required this.value,
    required this.mathTexts,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: MText(
              inputText: stepNumber.toString(),
              size: 12.sp,
              weight: FontWeight.w700,
              textColor: AppColors.main
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText(
                inputText: title,
                size: 11.sp,
                weight: FontWeight.w600,
                textColor: AppColors.appliancestext2,
              ),
              SizedBox(height: 4.h),
              MText(
                inputText: value,
                size: 16.sp,
                weight: FontWeight.w700,
                textColor: AppColors.textColor,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.searchtextField),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: mathTexts
                      .map((text) => Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: MText(
                      inputText: text,
                      size: 12.sp,
                      weight: FontWeight.w400,
                      textColor: Color(0xff333333),
                      textAlign: TextAlign.start,
                    ),
                  ))
                      .toList(),
                ),
              ),
              if (description != null) ...[
                SizedBox(height: 8.h),
                MText(
                  inputText: description!,
                  size: 10.sp,
                  weight: FontWeight.w400,
                  textColor: AppColors.textColor2,
                  textAlign: TextAlign.start,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}