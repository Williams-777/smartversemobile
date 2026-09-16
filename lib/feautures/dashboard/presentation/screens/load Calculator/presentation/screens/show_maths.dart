import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/app_bar_icon.dart';
import 'package:smartversemobile/core/widgets/app_button.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/appliance_table_card.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/qty.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/surge_sensitive_container.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/load%20Calculator/presentation/screens/widgets/walkthrough_card.dart';
class ShowMaths extends StatefulWidget {
  const ShowMaths({super.key});

  @override
  State<ShowMaths> createState() => _ShowMathsState();
}

class _ShowMathsState extends State<ShowMaths> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 46.h,),
              Row(
                children: [AppbarIcon(), SizedBox(width: 12.w,), MText(inputText: "How we sized your system", weight: FontWeight.w700, textColor: AppColors.textColor, size: 16.sp,),],
              ),
                SizedBox(height: 36.h,),
  
                ApplianceTableCard(appliances: [
                    ApplianceItem(iconAsset: "assets/images/microwave.png", name: "Microwave", surgeText: "×3.5 surge", qty: 1, watts: 600, dailyKWh: 1.80,),
                    ApplianceItem(iconAsset: "assets/images/kettle.png", name: "Electric Kettle", qty: 1, watts: 200, dailyKWh: 1.40,),
                    ApplianceItem(iconAsset: "assets/images/blender.png", name: "Blender", surgeText: "Heavy", qty: 1, watts: 400, dailyKWh: 1.60,),
                  ],
                ),
                SizedBox(height: 16.62.h,),
                SurgeSC(),
                SizedBox(height: 16.h,),
                MText(inputText: "WALKTHROUGH", size: 13.spMin, weight: FontWeight.w700, textColor: AppColors.primary, ),
                SizedBox(height: 12.h,),
                 WalkthroughCard(),
                SizedBox(height: 24.h,),
                SizedBox(height: 48.68.h,),
                Container(
                  width: 390.w,
                  height: 94.h,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    border: Border.all(width: 1.w, color: AppColors.main) ,
                  ),
                  child: Center(
                    child: AppButton(title: "Save & Share", onTap: (){Navigator.pushNamed(context, AppRoute.savedCalculation);},),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



