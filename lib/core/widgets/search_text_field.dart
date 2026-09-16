import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const  SearchTextField({
    super.key,
    required this.search,
  });

  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 34.h,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color:Color(0x40E87A2D), width: 1),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/search_line.svg",
            width: 22.w,
            height: 22.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              cursorColor: AppColors.textColor,
              controller: search,
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: "Search Appliances",
                hintStyle: TextStyle(color: AppColors.searchtext, fontSize: 14.sp, fontWeight: .w400, fontFamily: "Montserrat"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}