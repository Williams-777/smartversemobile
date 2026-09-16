import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

const _presetWattages = [30, 60, 80, 100, 150, 200, 300, 400, 500, 600, 850, 900, 1000, 1200, 1500, 2000, 3000, 4000, 5000];

Future<int?> showEditWattageSheet(
    BuildContext context, {
      required String applianceName,
      required String imagePath,
      required int currentWattage,
    }) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => EditWattageSheet(applianceName: applianceName, imagePath: imagePath, currentWattage: currentWattage),
  );
}

class EditWattageSheet extends StatefulWidget {
  const EditWattageSheet({super.key, required this.applianceName, required this.imagePath, required this.currentWattage});

  final String applianceName;
  final String imagePath;
  final int currentWattage;

  @override
  State<EditWattageSheet> createState() => _EditWattageSheetState();
}

class _EditWattageSheetState extends State<EditWattageSheet> {
  late int _selected = widget.currentWattage;

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
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0x14000000),
                      border: Border.all(color: const Color(0x33000000)),
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
              SizedBox(height: 8.h),
              Row(
                children: [
                  Container(
                    width: 75.w,
                    height: 75.w,
                    decoration: BoxDecoration(color: const Color(0x80EAEFF5), borderRadius: BorderRadius.circular(10.r)),
                    child: Image.network(
                      widget.imagePath,
                      errorBuilder: (_, __, ___) => const Icon(Icons.devices_other),
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                      },
                    ),
                  ),
                  SizedBox(width: 41.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText(inputText: "Edit Wattage", weight: FontWeight.w700, size: 18.spMin, textColor: AppColors.textColor),
                      MText(inputText: widget.applianceName, weight: FontWeight.w400, size: 13.spMin, textColor: AppColors.textColor),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.25.h),
                decoration: BoxDecoration(color: const Color(0xffFFF9F5), borderRadius: BorderRadius.circular(20.r), border: Border.all(width: 1.75.spMin, color: const Color(0xffFDF2EA))),
                child: Row(
                  children: [
                    MText(inputText: "$_selected", weight: FontWeight.w700, size: 46.spMin, textColor: AppColors.appliancestext),
                    const Spacer(),
                    MText(inputText: "W", weight: FontWeight.w600, size: 22.spMin, textColor: AppColors.appliancestext2),
                  ],
                ),
              ),
              SizedBox(height: 19.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  const crossAxisCount = 5;
                  final spacing = 10.w;
                  final itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: 10.h,
                    children: [
                      for (final watt in _presetWattages)
                        GestureDetector(
                          onTap: () => setState(() => _selected = watt),
                          child: Container(
                            width: itemWidth,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6.75.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0x170B1A33), width: 1.spMin),
                              color: _selected == watt ? AppColors.primary : const Color(0xffFFF9F2),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: MText(
                              inputText: "${watt}W",
                              weight: FontWeight.w600,
                              size: 13.spMin,
                              textColor: _selected == watt ? AppColors.main : AppColors.appliancestext2,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 58.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.appliancestext2, width: 1.spMin),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: MText(inputText: "Cancel", weight: FontWeight.w600, size: 18.spMin, textColor: Color(0xff424242)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 33.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context, _selected),
                      child: Container(
                        height: 58.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: MText(inputText: "Save ${_selected}W", weight: FontWeight.w600, size: 18.spMin, textColor: AppColors.main),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}