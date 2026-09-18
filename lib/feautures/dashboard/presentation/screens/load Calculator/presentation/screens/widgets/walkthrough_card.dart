import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class WalkthroughCard extends StatelessWidget {
  const WalkthroughCard({
    super.key,
    required this.inverterKva,
    required this.peakSurgeKw,
    required this.dailyEnergyKwh,
    required this.batteryAh,
    required this.batteryVoltage,
    required this.panelCount,
    required this.panelWatts,
  });

  final num inverterKva;
  final double peakSurgeKw;
  final double dailyEnergyKwh;
  final int batteryAh;
  final int? batteryVoltage;
  final int panelCount;
  final int? panelWatts;

  @override
  Widget build(BuildContext context) {
    final rawKva = peakSurgeKw * 1.25 / 0.8;
    final voltageText = batteryVoltage?.toString() ?? "—";
    final showSolarStep = panelCount > 0 && panelWatts != null;
    final panelTotalW = showSolarStep ? panelCount * panelWatts! : 0;


    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: const BoxDecoration(color: Color(0x59FDF2EA)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _WalkthroughStep(

            stepNumber: 1,
            title: "INVERTER SIZE",
            value: "${inverterKva.toStringAsFixed(0)} kVA",
            mathTexts: [
              "Peak surge: ${peakSurgeKw.toStringAsFixed(1)}kW",
              "× 1.25 safety margin",
              "+ 0.8 power factor",
              "= ${rawKva.toStringAsFixed(2)} kVA → rounded up to ${inverterKva.toStringAsFixed(0)} kVA",
            ],
          ),
          SizedBox(height: 24.h),
          _WalkthroughStep(
            stepNumber: 2,
            title: "DAILY ENERGY",
            value: "${dailyEnergyKwh.toStringAsFixed(1)}kWh",
            mathTexts: ["Σ (watts × qty × hours/day) = ${dailyEnergyKwh.toStringAsFixed(1)}kWh"],
          ),
          SizedBox(height: 24.h),
          _WalkthroughStep(
            stepNumber: 3,
            title: "BATTERY",
            value: "${batteryAh}Ah/${voltageText}V",
            mathTexts: [
              "${dailyEnergyKwh.toStringAsFixed(2)}kWh ÷ 0.6 (DoD limit)",

              "÷ ${voltageText}V system",
              "= ${batteryAh}Ah (rounded)",
            ],
            description: "Depth of Discharge (DoD) at 60% protects battery lifespan. ${voltageText}V chosen based on inverter size.",
          ),
          SizedBox(height: 24.h),
          if (showSolarStep)
            _WalkthroughStep(

              stepNumber: 4,
              title: "SOLAR PANELS",
              value: "$panelCount × ${panelWatts}W panels",
              mathTexts: [
                "${dailyEnergyKwh.toStringAsFixed(1)}kWh ÷ (4.5 sun hrs × 0.85 eff)",
                "= ${(panelTotalW / 1000).toStringAsFixed(1)} kW → $panelCount panels of ${panelWatts}W",
              ],
              description: "4.5 peak sun hours/day, with 85% efficiency to account for system losses.",
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