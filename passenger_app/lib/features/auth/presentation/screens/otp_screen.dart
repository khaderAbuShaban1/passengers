import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../core/router/app_router.dart';
import '../../../../core/supabase/supabase_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String phone;

  const OtpScreen({super.key, required this.phone});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  Timer? _timer;
  int _resendCountdown = 60;
  bool _canResend = false;
  bool _isLoading = false;
  String? _errorMessage;

  String get _email => widget.phone;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() {
      _resendCountdown = 60;
      _canResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendCountdown <= 1) {
        timer.cancel();
        setState(() {
          _resendCountdown = 0;
          _canResend = true;
        });
      } else {
        setState(() => _resendCountdown--);
      }
    });
  }

  Future<void> _verifyOtp(String otp) async {
    if (otp.length != 6) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final client = SupabaseService.instance.client;

    try {
      final response = await _verifyEmailOtp(client, otp);
      final user = response.user ?? client.auth.currentUser;
      if (user == null) {
        throw const supabase.AuthException('Invalid verification code');
      }

      await client.from('profiles').upsert({
        'id': user.id,
        'phone': _email,
        'phone_number': _email,
        'role': 'passenger',
        'is_active': true,
      }, onConflict: 'id');

      if (mounted) context.go(AppRoutes.home);
    } on supabase.AuthException catch (e) {
      if (mounted) setState(() => _errorMessage = e.message);
    } catch (e) {
      if (mounted) setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _resendOtp() async {
    if (!_canResend) return;

    final client = SupabaseService.instance.client;

    try {
      await client.auth.signInWithOtp(
        email: _email,
        shouldCreateUser: true,
        data: {'role': 'passenger'},
      );
      if (!mounted) return;
      _pinController.clear();
      _startCountdown();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New OTP sent')),
      );
    } on supabase.AuthException catch (e) {
      if (mounted) setState(() => _errorMessage = e.message);
    } catch (e) {
      if (mounted) setState(() => _errorMessage = e.toString());
    }
  }

  Future<supabase.AuthResponse> _verifyEmailOtp(
    supabase.SupabaseClient client,
    String otp,
  ) async {
    try {
      return await client.auth.verifyOTP(
        email: _email,
        token: otp,
        type: supabase.OtpType.email,
      );
    } on supabase.AuthException {
      return client.auth.verifyOTP(
        email: _email,
        token: otp,
        type: supabase.OtpType.signup,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 52,
      height: 58,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textDisabled, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.surfaceVariant,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mark_email_read_outlined,
                  color: AppColors.primary,
                  size: 36,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Enter verification code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Code sent to $_email',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 6,
                  controller: _pinController,
                  focusNode: _focusNode,
                  autofocus: true,
                  enabled: !_isLoading,
                  defaultPinTheme: defaultTheme,
                  focusedPinTheme: defaultTheme.copyWith(
                    decoration: defaultTheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                  ),
                  errorPinTheme: defaultTheme.copyWith(
                    decoration: defaultTheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.error, width: 2),
                    ),
                  ),
                  onCompleted: _verifyOtp,
                ),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.error),
                ),
              ],
              const SizedBox(height: 32),
              CustomButton(
                label: 'Verify',
                onPressed: () => _verifyOtp(_pinController.text),
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
              _canResend
                  ? TextButton(
                      onPressed: _resendOtp,
                      child: const Text('Resend OTP'),
                    )
                  : Text(
                      'Resend after ${_resendCountdown}s',
                      style: const TextStyle(color: AppColors.textHint),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
