import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/network/token_storage.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_submit_button.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TokenStorage.instance,
      builder: (context, _) {
        final isSignedIn = TokenStorage.instance.isSignedIn;
        return Scaffold(
          backgroundColor: AppColors.main,
          body: SafeArea(
            child: Column(
              children: [
                _ProfileHeader(isSignedIn: isSignedIn),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20.w),
                    child: isSignedIn ? const _SignedInBody() : const _SignedOutBody(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final bool isSignedIn;

  const _ProfileHeader({required this.isSignedIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
      decoration: BoxDecoration(
        color: AppColors.appliancestext,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your profile",
            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 24.h),
          Center(
            child: Column(
              children: [
                Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.08)),
                  child: Icon(Icons.person, size: 36.sp, color: Colors.white54),
                ),
                SizedBox(height: 16.h),
                if (isSignedIn) ...[
                  Text(
                    TokenStorage.instance.fullName ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    TokenStorage.instance.email ?? '',
                    style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                  ),
                ] else ...[
                  Text(
                    "Not signed in",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Sign in to save your calculations, export results, and access your profile.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SignedOutBody extends StatelessWidget {
  const _SignedOutBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthSubmitButton(
          text: "Sign in to your account",
          onTap: () => Navigator.pushNamed(context, AppRoute.login),
        ),
        SizedBox(height: 12.h),
        _OutlineActionButton(
          text: "Create free account",
          onTap: () => Navigator.pushNamed(context, AppRoute.createAccount),
        ),
        SizedBox(height: 24.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(color: AppColors.appliancestext, borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "WHAT YOU GET FOR FREE",
                style: TextStyle(color: Colors.white54, fontSize: 11.sp, fontWeight: FontWeight.w700, letterSpacing: 1),
              ),
              SizedBox(height: 14.h),
              _benefitRow("Save unlimited calculations"),
              _benefitRow("Export PDF summaries"),
              _benefitRow("Sync across devices"),
              _benefitRow("Access saved profiles anytime"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _benefitRow(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 16.sp, color: AppColors.successGreen),
          SizedBox(width: 10.w),
          Expanded(child: Text(text, style: TextStyle(color: Colors.white70, fontSize: 13.sp))),
        ],
      ),
    );
  }
}

class _SignedInBody extends StatelessWidget {
  const _SignedInBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _OutlineActionButton(
          text: "Sign out",
          onTap: () => TokenStorage.instance.clear(),
        ),
        SizedBox(height: 20.h),
        Text(
          "More profile settings are coming soon.",
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.grey700, fontSize: 13.sp),
        ),
      ],
    );
  }
}

class _OutlineActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _OutlineActionButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: const Color(0xFF2D5A9E)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xFF2D5A9E), fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}