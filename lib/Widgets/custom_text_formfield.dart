import 'package:flutter/material.dart';

import '../Screens/Styles/colors.dart';


Widget customTextField(
    {
      String? title,
      String? hint,
      String? hintText,
      Widget? suffix, suffixIcon,
      Color?  fillColor,

      TextEditingController? controller,
      int? maxLines = 1}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style:TextStyle(fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: fillColor,
            hintText: hintText,
            helperStyle:  TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.quickSilver,
            ),
            suffix: suffixIcon,
            hintStyle:  TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.quickSilver,
            ),
            contentPadding: const EdgeInsets.all(18),
            enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                  color: AppColor.gray,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(14)),
            focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                  color: AppColor.gray,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(14)),
          ),
        ),
      )
    ],
  );
}