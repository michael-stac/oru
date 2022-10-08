import 'package:flutter/material.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:gigi/Widgets/custom_button.dart';

class Notifications {
  static showCustomQueryDialogue({
    required BuildContext context,
    String message = '',
    String subMessage = '',
    String okText = 'Yes',
    String cancelText = 'No',
    String image = 'assets/images/onboarding_two.png',
    required VoidCallback onOkClicked,
    required VoidCallback onCancelClicked,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset(image),
                  ),
                  const SizedBox(height: 25),
                  Text(message,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Text(subMessage,
                      style: const TextStyle(), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  customButton(
                    context,
                    onTap: onOkClicked,
                    text: okText,
                    bgColor: AppColor.primaryColor,
                    textColor: AppColor.white,
                  ),
                  const SizedBox(height: 15),
                  customButton(
                    context,
                    onTap: () => Navigator.pop(ctx),
                    text: cancelText,
                    bgColor: AppColor.white,
                    textColor: AppColor.primaryColor,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
