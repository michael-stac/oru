import 'package:flutter/material.dart';

import '../Screens/Styles/colors.dart';


void success(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: AppColor.primaryColor,
  ));
}

void error(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: AppColor.red,
  ));
}
