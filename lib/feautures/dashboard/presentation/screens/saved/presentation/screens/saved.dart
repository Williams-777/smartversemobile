import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/app_bar_icon.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/bloc/calculation_cubit.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/bloc/calculation_state.dart';
import '../../../../../data/models/calculation_detail.dart';

import 'widgets/empty_saved_profiles.dart';
import 'widgets/saved_profile_card.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  void initState() {
    super.initState();
    context.read<CalculationCubit>().loadSavedCalculations();
  }

  Future<void> _confirmDelete(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text("Delete this profile?"),

        content: Text("This can't be undone."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Delete")),
        ],
      ),
    );
    if (confirmed == true) {
      await context.read<CalculationCubit>().deleteCalculation(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppbarIcon(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(AppRoute.dashboardScreen, (route) => false);
                      }
                    },
                  ),
                  MText(inputText: "SAVED PROFILES", size: 16.spMin, weight: FontWeight.w700, textColor: AppColors.appliancestext),
                  GestureDetector(
                    onTap: () => Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(AppRoute.dashboardScreen, (route) => false),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12.r)),

                      child: MText(inputText: "+ New", size: 14.spMin, weight: FontWeight.w600, textColor: AppColors.main),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: BlocBuilder<CalculationCubit, CalculationState>(
                builder: (context, state) {
                  if (state.savedCalculations.isEmpty) {
                    return EmptySavedProfiles(
                      onCalculateNow: () => Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(AppRoute.dashboardScreen, (route) => false),
                    );
                  }
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    children: [
                      for (final detail in state.savedCalculations)
                        SavedProfileCard(
                          title: detail.label,
                          date: DateFormat('d MMM yyyy').format(detail.createdAt),
                          kvaValue: detail.result.recommendation.inverterKva.toStringAsFixed(0),
                          itemsCount: "${detail.distinctApplianceCount}",
                          loadValue: "${(detail.result.summary.totalRunningLoadWatts / 1000).toStringAsFixed(1)}kW",
                          batteryValue: "${detail.result.recommendation.battery.capacityAh}Ah",
                          solarValue: detail.result.recommendation.solar.panelCount > 0
                              ? "${detail.result.recommendation.solar.panelCount} pnl"
                              : "—",
                          modeText: detail.modeText,
                          onDelete: () => _confirmDelete(detail.id),
                          onOpen: () async {

                            await context.read<CalculationCubit>().loadSavedCalculationDetail(detail.id);
                            if (!context.mounted) return;
                            Navigator.pushNamed(context, AppRoute.savedCalculation, arguments: {'isViewingSaved': true});
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}