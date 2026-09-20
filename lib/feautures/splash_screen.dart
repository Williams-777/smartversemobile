import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/core/storage/onboarding_storage.dart';
import 'onboarding_screen.dart';

class SplashColors {
  static const backgroundBase = Color(0xFF0E1A34);
  static const backgroundGlow = Color(0xFF1E2E58);
  static const tagline = Color(0xFF7BAADF);
}

class SplashScreen extends StatefulWidget {
  final VoidCallback onOnboardingFinish;

  const SplashScreen({super.key, required this.onOnboardingFinish});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      final next = OnboardingStorage.instance.hasSeenOnboarding
          ? AppRoute.dashboardScreen
          : AppRoute.onboarding;
      Navigator.pushReplacementNamed(context, next);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.4),
            radius: 1.1,
            colors: [
              SplashColors.backgroundGlow,
              SplashColors.backgroundBase,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 4),
              SizedBox(height: 120.h, width: 120.w),
              const Spacer(flex: 1),
              Text(
                'Smartvert',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 46.sp,
                  fontWeight: FontWeight.w700,
                  height: 52 / 46,
                  color: Color(0xFFFFFFFF)

                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.h,
                          color: Color(0xffB3B8C0)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        'Know your solar. Right size, first time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          height: 19.5 / 13,
                          letterSpacing: 0.6,
                          color: SplashColors.tagline,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: Color(0xffB3B8C0)

                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}