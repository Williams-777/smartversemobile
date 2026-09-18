import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/app_bar_icon.dart';
import 'package:smartversemobile/core/widgets/app_button.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/appliance_table_card.dart';

import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/surge_sensitive_container.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/walkthrough_card.dart';

import '../../../../bloc/appliance_cubit.dart';
import '../../../../bloc/appliance_state.dart';
import '../../../../bloc/calculation_cubit.dart';
import '../../../../bloc/calculation_state.dart';

class ShowMaths extends StatelessWidget {
  const ShowMaths({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationCubit, CalculationState>(
      builder: (context, calcState) {
        final result = calcState.result;

        if (calcState.status == CalculationStatus.error) {
          return Scaffold(
            backgroundColor: AppColors.main,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MText(
                      inputText: calcState.errorMessage ?? "Something went wrong",
                      weight: FontWeight.w600,
                      textColor: AppColors.textColor,
                      size: 14.sp,
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      title: "Retry",
                      onTap: () {
                        final applianceState = context.read<ApplianceCubit>().state;
                        context.read<CalculationCubit>().calculate(applianceState);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (result == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return BlocBuilder<ApplianceCubit, ApplianceState>(
          builder: (context, applianceState) {
            String? imageUrlFor(String applianceName) {
              for (final a in applianceState.appliances) {
                if (a.name == applianceName) return a.imageUrl;
              }
              return null;
            }

            final applianceItems = result.breakdown.map((b) => ApplianceItem(
              imageUrl: imageUrlFor(b.applianceName),
              name: b.applianceName,
              surgeText: b.surgeApplicable ? "×${(b.surgeWatts / (b.wattage == 0 ? 1 : b.wattage)).toStringAsFixed(1)} surge" : null,
              qty: b.quantity,
              watts: b.wattage,
              dailyKWh: b.dailyEnergyWh / 1000,
            )).toList();

            final hasSurge = result.breakdown.any((b) => b.surgeApplicable);
            final peakSurgeKw = result.summary.peakLoadWatts / 1000;
            final rec = result.recommendation;
            final dailyKwh = result.summary.dailyEnergyWh / 1000;

            return Scaffold(
              backgroundColor: AppColors.main,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 46.h),
                        Row(
                          children: [AppbarIcon(), SizedBox(width: 12.w), MText(inputText: "How we sized your system", weight: FontWeight.w700, textColor: AppColors.textColor, size: 16.sp)],
                        ),
                        SizedBox(height: 36.h),
                        ApplianceTableCard(appliances: applianceItems),
                        SizedBox(height: 16.62.h),
                        if (hasSurge) SurgeSC(peakSurgeKw: peakSurgeKw),
                        SizedBox(height: 16.h),
                        MText(inputText: "WALKTHROUGH", size: 13.spMin, weight: FontWeight.w700, textColor: AppColors.primary),
                        SizedBox(height: 12.h),
                        WalkthroughCard(
                          inverterKva: rec.inverterKva,
                          peakSurgeKw: peakSurgeKw,
                          dailyEnergyKwh: dailyKwh,
                          batteryAh: rec.battery.capacityAh,
                          batteryVoltage: rec.battery.systemVoltage,
                          panelCount: rec.solar.panelCount,
                          panelWatts: rec.solar.panelWatts,
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(height: 48.68.h),
                        Container(
                          width: 390.w,
                          height: 94.h,
                          decoration: BoxDecoration(color: AppColors.main, border: Border.all(width: 1.w, color: AppColors.main)),
                          child: Center(
                            child: AppButton(
                              title: "Save & Share",
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.savedCalculation);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}