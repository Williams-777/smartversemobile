import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/based_on_microwave.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/calculated_container.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/load_profile_container.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/save_share.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/stat_card.dart';

import '../../../../../../../app/theme/app_colors.dart';
import '../../../../bloc/calculation_cubit.dart';
import '../../../../bloc/calculation_state.dart';
class LoadCalculatorBackupOnly extends StatelessWidget {
  const LoadCalculatorBackupOnly({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<CalculationCubit, CalculationState>(
   builder: (context, state) {
     final result = state.result;
     if (result == null)
       return const Scaffold(body: Center(child: CircularProgressIndicator()));

     final rec = result.recommendation;
     final applianceNames = result.breakdown
         .map((b) => b.applianceName)
         .take(3)
         .join(", ");

     return Scaffold(
       backgroundColor: AppColors.calculatedBg,
       body: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               CalculatedContainer(
                 assetImagePath: "assets/images/noto_house.png",
                 label: "Backup only",
                 borderColor: Color(0x802D5A9E),),
               SizedBox(height: 16.h),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 15.5.w),
                 child: BasedOnMicrowaveContainer(
                   message: "Based on your $applianceNames usage, we recommend a ${rec.inverterKva.toStringAsFixed(0)} kVA inverter, "
                       "a ${rec.battery.capacityAh}Ah/${rec.battery.systemVoltage}V battery bank, and ${rec.solar.panelCount} × ${rec.solar.panelWatts}W solar panels.",
                 ),
               ),
               SizedBox(height: 16.h),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 15.5.w),
                 child: LoadProfileContainer(),
               ),
               SizedBox(height: 16.h),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                 child: IntrinsicHeight(
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                       Expanded(child: StatCard(
                         iconAsset: 'assets/images/🔋.png', title: "Battery bank",
                         value: "${rec.battery.capacityAh}", unit: "Ah",
                         subtitle: "${rec.battery.systemVoltage}V · ${rec.battery.energyKwh}kWh usable",
                       )),
                       SizedBox(width: 12.w),
                       Expanded(child: StatCard(
                         iconAsset: 'assets/images/☀️.png', title: "Solar panels",
                         value: "${rec.solar.panelCount}", unit: "pnl",
                         subtitle: "${rec.solar.panelWatts}W each · ${rec.solar.capacityKw}kW total",
                       ))
                     ],
                   ),
                 ),
               ),
               SizedBox(height: 12.h),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                 child: IntrinsicHeight(
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                       Expanded(child: StatCard(
                         iconAsset: 'assets/images/⚡.png', title: "Inverter size",
                         value: rec.inverterKva.toStringAsFixed(0), valueColor: AppColors.primary, unit: "kVA",
                         subtitle: "${rec.battery.systemVoltage}V system voltage",
                       )),
                       SizedBox(width: 12.w),
                       Expanded(child: StatCard(
                         iconAsset: 'assets/images/📊.png', title: "Daily energy",
                         value: (result.summary.dailyEnergyWh / 1000).toStringAsFixed(1), unit: "kWH",
                         valueColor: AppColors.appliancestext, unitColor: AppColors.appliancestext,
                         subtitle: "Peak surge: ${(result.summary.peakLoadWatts / 1000).toStringAsFixed(1)}kW",
                       )),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: 24.h,),
               SaveAndShareC(
                 onSaveAndShare: () async {
                   await context.read<CalculationCubit>().saveCalculation("My system");
                 },
                 onShowMaths: () => Navigator.pushNamed(context, AppRoute.showMaths),
               ),
             ],
           ),
         ),
       ),
     );
   }
);
  }
}
