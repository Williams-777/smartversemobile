import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/di/service_locator.dart';
import 'package:smartversemobile/core/widgets/app_bar_icon.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/resend_verification_cubit.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/resend_verification_state.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/verify_email_cubit.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/verify_email_state.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_submit_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  final String email;

  const EmailVerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => VerifyEmailCubit(getIt())),
        BlocProvider(create: (_) => ResendVerificationCubit(getIt())),
      ],
      child: _EmailVerificationView(email: email),
    );
  }
}

class _EmailVerificationView extends StatefulWidget {
  final String email;

  const _EmailVerificationView({required this.email});

  @override
  State<_EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<_EmailVerificationView> {
  static const _codeLength = 6;
  String _code = '';

  void _onKeyTap(String digit) {
    if (_code.length >= _codeLength) return;
    setState(() => _code += digit);
  }

  void _onBackspace() {
    if (_code.isEmpty) return;
    setState(() => _code = _code.substring(0, _code.length - 1));
  }

  void _handleVerify() {
    if (_code.length != _codeLength) return;
    context.read<VerifyEmailCubit>().verify(token: _code);
  }

  @override
  Widget build(BuildContext context) {
    final isComplete = _code.length == _codeLength;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<VerifyEmailCubit, VerifyEmailState>(
              listener: (context, state) {
                if (state is VerifyEmailSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email verified — you can now log in')),
                  );
                  Navigator.pushNamedAndRemoveUntil(context, AppRoute.login, (route) => false);
                } else if (state is VerifyEmailFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
            ),
            BlocListener<ResendVerificationCubit, ResendVerificationState>(
              listener: (context, state) {
                if (state is ResendVerificationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verification code resent')),
                  );
                } else if (state is ResendVerificationFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
            ),
          ],
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                AppbarIcon(assetPath: 'assets/icons/arrow_left_fill.svg'),
                SizedBox(height: 30.h),
                Center(
                  child: Text(
                    "Check your inbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Text(
                    "We have sent you a verification code by email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: AppColors.grey700),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.email,
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                      SizedBox(width: 6.w),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.edit_outlined, size: 16.sp, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_codeLength, (index) {
                    return _CodeDigitBox(
                      digit: index < _code.length ? _code[index] : null,
                      isActive: index == _code.length,
                    );
                  }),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: BlocBuilder<ResendVerificationCubit, ResendVerificationState>(
                    builder: (context, state) {
                      final isSending = state is ResendVerificationLoading;
                      return GestureDetector(
                        onTap: isSending
                            ? null
                            : () => context.read<ResendVerificationCubit>().resend(email: widget.email),
                        child: Text(
                          isSending ? "Sending..." : "Resend code",
                          style: TextStyle(fontSize: 14.sp, color: AppColors.grey700, fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 25.h),
                BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
                  builder: (context, state) {
                    final isVerifying = state is VerifyEmailLoading;
                    if (isComplete) {
                      return AuthSubmitButton(
                        text: isVerifying ? "Verifying..." : "Verify",
                        onTap: isVerifying ? () {} : _handleVerify,
                      );
                    }
                    return Container(
                      width: double.infinity,
                      height: 55.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey400),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(color: AppColors.grey, fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                _NumericKeypad(onKeyTap: _onKeyTap, onBackspace: _onBackspace),
                SizedBox(height: 20.h + bottomInset),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CodeDigitBox extends StatelessWidget {
  final String? digit;
  final bool isActive;

  const _CodeDigitBox({required this.digit, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final isFilled = digit != null;
    return Container(
      width: 48.w,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isFilled ? AppColors.surgeContainer : AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isFilled || isActive ? AppColors.primary : AppColors.grey400,
          width: isActive && !isFilled ? 2 : 1,
        ),
      ),
      child: isFilled
          ? Text(digit!, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.black))
          : isActive
          ? Container(width: 2.w, height: 22.h, color: AppColors.primary)
          : null,
    );
  }
}

class _NumericKeypad extends StatelessWidget {
  final void Function(String) onKeyTap;
  final VoidCallback onBackspace;

  const _NumericKeypad({required this.onKeyTap, required this.onBackspace});

  static const _rows = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final row in _rows)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row.map((digit) => _key(digit, () => onKeyTap(digit))).toList(),
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 90.w, height: 64.h),
              _key('0', () => onKeyTap('0')),
              _iconKey(Icons.backspace_outlined, onBackspace),
            ],
          ),
        ),
      ],
    );
  }

  Widget _key(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 64.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: AppColors.powermode2, borderRadius: BorderRadius.circular(14.r)),
        child: Text(label, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.black)),
      ),
    );
  }

  Widget _iconKey(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 64.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: AppColors.powermode2, borderRadius: BorderRadius.circular(14.r)),
        child: Icon(icon, color: AppColors.black, size: 24.sp),
      ),
    );
  }
}