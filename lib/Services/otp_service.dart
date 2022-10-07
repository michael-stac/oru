import 'dart:developer';

import 'package:auth_handler/auth_handler.dart';
import 'package:email_otp/email_otp.dart';

import '../Helpers/fire_b_helpers.dart';
import '../Utils/strings.dart';
import 'db_service.dart';

class OtpService {
  // EmailOTP _otpAuth = EmailOTP();
  static final AuthHandler _otpHandler = AuthHandler();

  static Future<FAuthResponse> sendOtp({required String userEmail}) async {
    _otpHandler.config(
      otpLength: 4,
      senderEmail: Strings.appEmail,
      senderName: Strings.appName,
    );
    try {
      final otpRes = await _otpHandler.sendOtp(userEmail);

      if (!otpRes) {
        return FAuthResponse(message: 'An error ocuures while sending otp');
      }

      return FAuthResponse(message: 'Otp send successfully', isSuccess: true);
    } catch (e) {
      return FAuthResponse(message: 'An error ocuured', content: e.toString());
    }
  }

  static Future<FAuthResponse> verifyOtp(
      {required String otp, required String userId}) async {
    try {
      final otpRes = await _otpHandler.verifyOtp(otp);
      if (otpRes) {
        final status = await FDatabase.verifyUser(userId);
        if (!status.isSuccess) {
          return FAuthResponse(message: 'Failed to verify user');
        }
        return FAuthResponse(message: 'Otp is Verified', isSuccess: true);
      }
      return FAuthResponse(message: 'Enter a valid otp');
    } catch (e) {
      log('Error = = = $e');
      return FAuthResponse(message: 'An error ocuured', content: e.toString());
    }
  }

  // Future<FAuthResponse> sendOtp({required String userEmail}) async {
  //   _otpAuth.setConfig(
  //     appEmail: Strings.appEmail,
  //     appName: Strings.appName,
  //     otpLength: 4,
  //     otpType: OTPType.digitsOnly,
  //     userEmail: userEmail,
  //   );

  //   try {
  //     final otpRes = await _otpAuth.sendOTP();
  //     log('OTP Response =  $otpRes');
  //     if (!otpRes) {
  //       return FAuthResponse(message: 'An error ocuures while sending otp');
  //     }

  //     return FAuthResponse(message: 'Otp send successfully', isSuccess: true);
  //   } catch (e) {
  //     return FAuthResponse(message: e.toString());
  //   }
  // }

  // Future<FAuthResponse> verifyOtp(
  //     {required String otp, required String userId}) async {
  //   final otpRes = await _otpAuth.verifyOTP(otp: otp);
  //   log('OTP Response =  $otpRes');
  //   if (otpRes) {
  //     final status = await FDatabase.verifyUser(userId);
  //     if (!status.isSuccess) {
  //       return FAuthResponse(message: 'Failed to verify user');
  //     }
  //     return FAuthResponse(message: 'Otp is Verified', isSuccess: true);
  //   }
  //   return FAuthResponse(message: 'Enter a valid otp');
  // }
}
