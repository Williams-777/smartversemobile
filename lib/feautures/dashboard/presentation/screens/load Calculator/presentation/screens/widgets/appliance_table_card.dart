import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';


double get _qtyColWidth => 24.w;
double get _wattsColWidth => 48.w;
double get _dailyColWidth => 56.w;
double get _colGap => 16.w;

class ApplianceItem {
  final String iconAsset;
  final String name;
  final String? surgeText;
  final int qty;
  final int watts;
  final double dailyKWh;

  const ApplianceItem({
    required this.iconAsset,
    required this.name,
    this.surgeText,
    required this.qty,
    required this.watts,
    required this.dailyKWh,
  });
}

class ApplianceTableCard extends StatelessWidget {
  final List<ApplianceItem> appliances;

  const ApplianceTableCard({super.key, required this.appliances});


  @override
  Widget build(BuildContext context) {
    final totalQty = appliances.fold<int>(0, (sum, a) => sum + a.qty);
    final totalWatts = appliances.fold<int>(0, (sum, a) => sum + a.watts);
    final totalDaily =
    appliances.fold<double>(0, (sum, a) => sum + a.dailyKWh);

    return Container(
      width: 362.w,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TableHeader(),
          SizedBox(height: 10.h),
          for (int i = 0; i < appliances.length; i++) ...[
            _ApplianceRow(
              iconAsset: appliances[i].iconAsset,
              name: appliances[i].name,
              surgeText: appliances[i].surgeText,
              qty: appliances[i].qty.toString(),
              watts: "${appliances[i].watts}W",
              daily: "${appliances[i].dailyKWh.toStringAsFixed(2)}kW",
            ),
            if (i != appliances.length - 1) SizedBox(height: 20.h),
          ],
          SizedBox(height: 10.h),
          _TotalRow(

            qty: totalQty.toString(),
            watts: "${(totalWatts / 1000).toStringAsFixed(1)}KW",
            daily: "${totalDaily.toStringAsFixed(1)}KWH",
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      width: double.infinity,
      height: 39.h,
      decoration: BoxDecoration(
        color: AppColors.calculatedBg,
      ),
      child: Row(
        children: [
          Expanded(
            child: MText(
              inputText: "APPLIANCE",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
            ),
          ),

          SizedBox(
            width: _qtyColWidth,
            child: MText(
              inputText: "QTY",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: _colGap),
          SizedBox(
            width: _wattsColWidth,
            child: MText(
              inputText: "WATTS",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: _colGap),
          SizedBox(
            width: _dailyColWidth,
            child: MText(
              inputText: "DAILY",
              weight: FontWeight.w700,
              size: 10.spMin,
              textColor: const Color(0xffA0BAD4),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }
}

class _ApplianceRow extends StatelessWidget {
  final String iconAsset;
  final String name;
  final String? surgeText;
  final String qty;
  final String watts;
  final String daily;

  const _ApplianceRow({
    required this.iconAsset,
    required this.name,
    this.surgeText,
    required this.qty,
    required this.watts,
    required this.daily,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Container(
            width: 29.w,
            height: 31.h,

            decoration: const BoxDecoration(
              color: Color(0x80EAEFF5),
              shape: BoxShape.circle,
            ),
            child: Image.asset(iconAsset),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MText(
                  inputText: name,
                  weight: FontWeight.w600,
                  size: 13.spMin,
                  textColor: AppColors.appliancestext,
                ),
                if (surgeText != null) ...[
                  SizedBox(height: 5.h),
                  MText(
                    inputText: surgeText!,
                    weight: FontWeight.w600,
                    size: 10.spMin,
                    textColor: const Color(0xffC97B0A),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(
            width: _qtyColWidth,
            child: MText(

              inputText: qty,
              weight: FontWeight.w700,
              size: 13.spMin,
              textColor: AppColors.appliancestext,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: _colGap),
          SizedBox(
            width: _wattsColWidth,
            child: MText(
              inputText: watts,
              weight: FontWeight.w400,
              size: 12.spMin,
              textColor: AppColors.appliancestext2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: _colGap),
          SizedBox(
            width: _dailyColWidth,
            child: MText(
              inputText: daily,
              weight: FontWeight.w400,
              size: 12.spMin,
              textColor: AppColors.appliancestext2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

  }
}

class _TotalRow extends StatelessWidget {
  final String qty;
  final String watts;
  final String daily;

  const _TotalRow({
    required this.qty,
    required this.watts,
    required this.daily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.calculatedBg,
      ),
      child: Row(
        children: [
          Expanded(
            child: MText(
              inputText: "TOTAL",
              weight: FontWeight.w700,

              size: 13.spMin,
              textColor: AppColors.appliancestext,
            ),
          ),
          SizedBox(
            width: _qtyColWidth,
            child: MText(
              inputText: qty,
              weight: FontWeight.w700,
              size: 14.spMin,
              textColor: AppColors.appliancestext,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: _colGap),
          SizedBox(
            width: _wattsColWidth,
            child: MText(
              inputText: watts,
              weight: FontWeight.w700,
              size: 14.spMin,
              textColor: AppColors.appliancestext,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: _colGap),
          SizedBox(
            width: _dailyColWidth,
            child: MText(
              inputText: daily,
              weight: FontWeight.w700,
              size: 14.spMin,

              textColor: AppColors.appliancestext,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}