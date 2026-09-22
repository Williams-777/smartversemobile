import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/di/service_locator.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/reset_password_state.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_action_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_close_button.dart';

/// Shown right after the OTP email has been requested (see
/// ForgotPasswordSheet). Collects the 6-digit OTP plus a new password and
/// calls POST /auth/reset-password.
class ResetPasswordSheet extends StatefulWidget {
  final String email;

  const ResetPasswordSheet({super.key, required this.email});

  static void show(BuildContext context, {required String email}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider(
        create: (_) => ResetPasswordCubit(getIt()),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ResetPasswordSheet(email: email),
        ),
      ),
    );
  }

  @override
  State<ResetPasswordSheet> createState() => _ResetPasswordSheetState();
}

class _ResetPasswordSheetState extends State<ResetPasswordSheet> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password reset — you can now log in')),
          );
        } else if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ResetPasswordLoading;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SheetCloseButton(),
              const SizedBox(height: 10),
              const Text(
                "Enter the code we sent you",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.black),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "We sent a 6-digit code to ${widget.email}. Enter it below with your new password.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: AppColors.grey700),
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: "6-digit code",
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  prefixIcon: const Icon(Icons.pin_outlined, color: AppColors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New password (min. 8 characters)",
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
                ),
              ),
              const SizedBox(height: 30),
              SheetActionButton(
                text: isLoading ? "Resetting..." : "Reset password",
                onPressed: isLoading
                    ? () {}
                    : () {
                  final otp = _otpController.text.trim();
                  final newPassword = _newPasswordController.text;
                  if (otp.length != 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter the 6-digit code')),
                    );
                    return;
                  }
                  if (newPassword.length < 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password must be at least 8 characters')),
                    );
                    return;
                  }
                  context.read<ResetPasswordCubit>().reset(
                    email: widget.email,
                    otp: otp,
                    newPassword: newPassword,
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}