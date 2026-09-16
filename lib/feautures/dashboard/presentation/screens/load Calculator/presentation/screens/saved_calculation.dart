import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/action_options_card.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/based.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/microwave_x.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/recommended_inverter_card.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/save_share.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/save_to_account_c.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/saved_r.dart';

class SavedCalculation extends StatefulWidget {
  const SavedCalculation({super.key});

  @override
  State<SavedCalculation> createState() => _SavedCalculationState();
}

class _SavedCalculationState extends State<SavedCalculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            RecommendedInverterCard(kva: 3,date: DateTime.now()),
              SizedBox(height: 14.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:28.w),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: SavedR(title: 'Battery', subTitle: '250Ah/24V'),),
                    SizedBox(width: 8.w),
                    Expanded(child: SavedR(title: 'Solar', subTitle: '4 pnl'),),
                    SizedBox(width: 8.w),
                    Expanded(child: SavedR(title: 'Daily energy', subTitle: '6.0kWh'),),
                  ],
                ),
              ),
              SizedBox(height: 18.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 28.w),
                child: MicrowaveX(),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                child: Based(),
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 28.0.w),
                child: ActionOptionsCard(),
              ),
              SizedBox(height: 11.22.h,),
              Center(child: MText(inputText: "Calculations based on industry standards · smartvert.ng", textColor: Color(0xff9E9E9E),size: 9.spMin, weight: FontWeight.w400,)),
              SizedBox(height: 15.15.h,),
              SaveToAccountC()
            ],
          ),
        ),
      ),
    );
  }
}






