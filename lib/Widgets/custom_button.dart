import 'package:flutter/material.dart';

import '../Screens/Styles/colors.dart';

Widget customButton(BuildContext context,
    {required VoidCallback onTap,
    required String text,
    bool isLoading = false,
    Color? bgColor,
    Color? textColor}) {
  return GestureDetector(
    onTap: isLoading ? () {} : onTap,
    child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
       
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isLoading
                ? AppColor.primaryColor.withOpacity(0.7)
                : bgColor ?? AppColor.white,
            borderRadius: BorderRadius.circular(8)),
        child: isLoading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(color: AppColor.white),
              )
            : Text(
                text,
                style: TextStyle(
                    color: textColor ?? AppColor.primaryColor, fontFamily: ''),
              )),
  );
}
