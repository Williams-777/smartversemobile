
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/widgets/m_text.dart';

class NavItemData {
  final String iconPath;
  final String label;


  const NavItemData({required this.iconPath, required this.label});
}

const List<NavItemData> navItems = [
  NavItemData(iconPath: 'assets/icons/Icon(home).svg', label: 'Home'),
  NavItemData(iconPath: 'assets/icons/Icon(caculator).svg', label: 'Load Calculator'),
  NavItemData(iconPath: 'assets/icons/Icon(saved).svg', label: 'Saved'),
  NavItemData(iconPath: 'assets/icons/Icon(account).svg', label: 'Account'),
];

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        border: const Border(
          top: BorderSide(color: AppColors.primary, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return _NavBarItem(
            data: item,
            isActive: index == currentIndex,
            onTap: () => onTap(index),
          );
        }),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final NavItemData data;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.data,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.textColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            data.iconPath,
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          SizedBox(height: 4.h),
          MText(
            inputText: data.label,
            size: 12.sp,
            weight: isActive ? FontWeight.w600 : FontWeight.w400,
            textColor: color,
          ),
           // SizedBox(height: 4.h),
          // isActive
          //     ? Container(
          //   width: 4.w,
          //   height: 4.w,
          //   decoration: BoxDecoration(
          //     color: AppColors.primary,
          //     shape: BoxShape.circle,
          //   ),
          // )
          //     : SizedBox(height: 4.w),
        ],
      ),
    );
  }
}