import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class ApplianceCard extends StatefulWidget {
  final String imageUrl;
  final String subtitleText;
  final String applianceName;
  final List<String> badges;
  final IconData fallbackIcon;
  final int initialQuantity;
  final ValueChanged<int>? onQuantityChanged;
  final VoidCallback? onTap;
  final VoidCallback? onSubtitleTap;

  const ApplianceCard({
    super.key,
    required this.imageUrl,
    required this.subtitleText,
    this.applianceName = "Appliance",
    this.badges = const [],
    this.fallbackIcon = Icons.devices_other,
    this.initialQuantity = 0,
    this.onQuantityChanged,
    this.onTap,
    this.onSubtitleTap,
  });

  @override
  State<ApplianceCard> createState() => _ApplianceCardState();

}

class _ApplianceCardState extends State<ApplianceCard> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _updateQuantity(int newValue) {
    if (newValue < 0) return;
    setState(() => _quantity = newValue);
    widget.onQuantityChanged?.call(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              width: 75.w,
              height: 75.h,
              decoration: BoxDecoration(
                color: const Color(0x80EAEFF5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Image.network(
                  widget.imageUrl,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(widget.fallbackIcon, size: 40.sp, color: Colors.black54),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MText(
                          inputText: widget.applianceName,
                          textColor: AppColors.textColor,
                          weight: FontWeight.w600,
                          size: 18.spMin,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      if (widget.badges.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Wrap(
                            spacing: 4.w,
                            runSpacing: 4.h,
                            children: [
                              for (final badge in widget.badges)
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFE99C6A)),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: MText(
                                    inputText: badge,
                                    textColor: AppColors.surgeText,

                                    weight: FontWeight.w700,
                                    size: 9.spMin,
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: widget.onSubtitleTap,
                          behavior: HitTestBehavior.opaque,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,

                            fit: BoxFit.scaleDown,
                            child: MText(
                              inputText: widget.subtitleText,
                              textColor: AppColors.appliancestext2,
                              weight: FontWeight.w400,
                              size: 14.spMin,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 25.w),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _updateQuantity(_quantity - 1),
                            child: Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(color: AppColors.surgeContainer, shape: BoxShape.circle),
                              child: Icon(Icons.remove, size: 20.sp, color: AppColors.textColor),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          MText(inputText: "$_quantity", textColor: AppColors.textColor, weight: FontWeight.w700, size: 16.spMin),
                          SizedBox(width: 12.w),
                          GestureDetector(
                            onTap: () => _updateQuantity(_quantity + 1),
                            child: Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(color: AppColors.surgeContainer, shape: BoxShape.circle),
                              child: Icon(Icons.add, size: 20.sp, color: AppColors.textColor),

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}