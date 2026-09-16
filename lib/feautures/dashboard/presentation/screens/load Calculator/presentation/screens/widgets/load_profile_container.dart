import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class LoadProfileContainer extends StatelessWidget {
  const LoadProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MText(
            inputText: "LOAD PROFILE",
            size: 13.spMin,
            weight: FontWeight.w700,
            textColor: AppColors.appliancestext,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGaugeItem(
                value: "1.8kW",
                label: "PEAK SURGE",
                progressColor: AppColors.primary,
                valueSweepDegree: 75,
              ),
              _buildGaugeItem(
                value: "6.0kWh",
                label: "DAILY",
                progressColor: AppColors.appliancestext2,
                valueSweepDegree: 97,
              ),
              _buildGaugeItem(
                value: "1.2kW",
                label: "RUNNING",
                progressColor: AppColors.primary,
                valueSweepDegree: 42,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeItem({
    required String value,
    required String label,
    required Color progressColor,
    required double valueSweepDegree,
  }) {
    return SizedBox(
      width: 95.w,
      height: 95.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(95.w, 95.w),
            painter: _LoadGaugePainter(
              progressColor: progressColor,
              valueSweepDegree: valueSweepDegree,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MText(
                inputText: value,
                size: 15.spMin,
                weight: FontWeight.w700,
                textColor: AppColors.appliancestext,
              ),
              SizedBox(height: 2.h),
              MText(
                inputText: label,
                size: 9.spMin,
                weight: FontWeight.w700,
                textColor: AppColors.textColor2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoadGaugePainter extends CustomPainter {
  final Color progressColor;
  final double valueSweepDegree;


  static const double _trackStartDegree = 60;
  static const double _trackTotalSweepDegree = 235;

  _LoadGaugePainter({
    required this.progressColor,
    required this.valueSweepDegree,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 12.w) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final Paint bgPaint = Paint()
      ..color = const Color(0xFFD9D9D9)
      ..strokeWidth = 9.w
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Paint fgPaint = Paint()
      ..color = progressColor
      ..strokeWidth = 9.w
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;


    canvas.drawArc(
      rect,
      _trackStartDegree * math.pi / 180,
      valueSweepDegree * math.pi / 180,
      false,
      fgPaint,
    );


    final double grayStartDegree = _trackStartDegree + valueSweepDegree;
    final double graySweepDegree = _trackTotalSweepDegree - valueSweepDegree;

    canvas.drawArc(
      rect,
      grayStartDegree * math.pi / 180,
      graySweepDegree * math.pi / 180,
      false,
      bgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _LoadGaugePainter oldDelegate) {
    return oldDelegate.progressColor != progressColor ||
        oldDelegate.valueSweepDegree != valueSweepDegree;
  }
}