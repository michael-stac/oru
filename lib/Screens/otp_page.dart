import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gigi/Screens/Authentication/CreateProfile/profile.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:gigi/Services/auth_service.dart';
import 'package:gigi/Services/otp_service.dart';
import 'package:gigi/Utils/router.dart';
import 'package:gigi/Widgets/custom_button.dart';
import 'package:gigi/Widgets/custom_notification.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.userId});

  final String userId;

  static const size = SizedBox(width: 10);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  TextEditingController node1Contoller = TextEditingController();
  TextEditingController node2Contoller = TextEditingController();
  TextEditingController node3Contoller = TextEditingController();
  TextEditingController node4Contoller = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Text(
              'Verify Otp',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: node1Contoller,
                  focusNode: node1,
                  onChanged: (value) {
                    _changeField(value, node2);
                  },
                )),
                OtpPage.size,
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: node2Contoller,
                  focusNode: node2,
                  onChanged: (value) {
                    _changeField(value, node3);
                  },
                )),
                OtpPage.size,
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: node3Contoller,
                  focusNode: node3,
                  onChanged: (value) {
                    _changeField(value, node4);
                  },
                )),
                OtpPage.size,
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: node4Contoller,
                  focusNode: node4,
                )),
              ],
            ),
            SizedBox(height: 20),
            customButton(
              context,
              onTap: _verifyOtp,
              text: 'VERIFY',
              bgColor: AppColor.primaryColor,
              textColor: AppColor.white,
              isLoading: isLoading,
            )
          ],
        ),
      )),
    );
  }

  _changeField(String value, FocusNode nextNode) {
    if (value.isNotEmpty) {
      nextNode.requestFocus();
    }
  }

  void _verifyOtp() async {
    final otp = node1Contoller.text +
        node2Contoller.text +
        node3Contoller.text +
        node4Contoller.text;

    log(otp);

    if (otp.length < 4) {
      showCustomNotification(context, 'Otp not complete');
      return;
    }
    // nextPageOnly(context, page: CreateProfile());

    try {
      log('Befor me');
      final otpValue = int.parse(otp);
      log(otpValue.toString());
      setState(() => isLoading = true);
      final otpStatus = await OtpService.verifyOtp(
          otp: otpValue.toString(), userId: widget.userId);
      setState(() => isLoading = false);

      if (!otpStatus.isSuccess) {
        showCustomNotification(context, otpStatus.message);
        return;
      }
      showCustomNotification(context, otpStatus.message);
      nextPageOnly(context,
          page: CreateProfile(
            userId: widget.userId,
          ));
    } catch (e) {
      showCustomNotification(context, 'Enter only digits');
    }
  }
}
