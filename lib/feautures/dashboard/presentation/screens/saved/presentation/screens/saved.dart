import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/app_bar_icon.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'widgets/empty_saved_profiles.dart';
import 'widgets/saved_profile_card.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  bool isEmpty = true;

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
                  AppbarIcon(),
                  MText(
                    inputText: "SAVED PROFILES",
                    size: 16.spMin,
                    weight: FontWeight.w700,
                    textColor: AppColors.appliancestext,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: MText(
                      inputText: "+ New",
                      size: 14.spMin,
                      weight: FontWeight.w600,
                      textColor: AppColors.main,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: isEmpty
                  ? EmptySavedProfiles(
                      onCalculateNow: () {
                        // TODO: Navigate to calculate screen
                      },
                    )
                  : ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        SavedProfileCard(
                          title: "Profile 1",
                          date: "7 Sept 2026",
                          kvaValue: "3",
                          itemsCount: "3",
                          loadValue: "1.2kW",
                          batteryValue: "250Ah",
                          solarValue: "4 pnl",
                          modeText: "Off-grid",
                          onDelete: () {
                            // TODO: Implement delete
                          },
                          onOpen: () {
                            // TODO: Implement open
                          },
                        ),
                        // Add more SavedProfileCard here if needed
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
