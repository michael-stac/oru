import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/image_picker.dart';
import '../../../Utils/router.dart';
import '../../../Widgets/custom_button.dart';
import '../../Styles/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String path = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: BackButton(
          color: AppColor.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    path == ''
                        ? const CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/edit.png'))
                        : CircleAvatar(
                            radius: 60, backgroundImage: FileImage(File(path))),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            color: Colors.grey,
                            height: 200,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.gray,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(24))),
                                  padding: const EdgeInsets.only(
                                      top: 14, bottom: 14),
                                  width: 300,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          "Take photo from camera",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: AppColor.white),
                                        ),
                                        onTap: () {
                                          OpenCamera()
                                              .pickCamera()
                                              .then((value) {
                                            if (value != '') {
                                              path = value;
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            }
                                          });
                                        },
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: AppColor.white,
                                        height: 27,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          OpenCamera()
                                              .pickCamera(source: ImageSource.gallery)
                                              .then((value) {
                                            if (value != '') {
                                              path = value;
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            }
                                          });
                                        },
                                        child: Text(
                                          "Choose from Photos",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: AppColor.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    alignment: Alignment.center,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: AppColor.gray,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(14))),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColor.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Upload profile photo',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blue),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Business Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Aiby Arena',
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.gray),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1.5,
                      color: AppColor.Gainsboro,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Business Sector",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Event centre',
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.gray),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1.5,
                      color: AppColor.Gainsboro,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Email address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'aibyarena@gmail.com',
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.gray),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1.5,
                      color: AppColor.Gainsboro,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: '+2348000000000',
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.gray),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1.5,
                      color: AppColor.Gainsboro,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Address ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'No.4 Abacha road, GRA',
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.gray),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1.5,
                      color: AppColor.Gainsboro,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Achievement Level",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.oldSilver),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65),
                          child: Text(
                            "Emerald",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.oldSilver),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    customButton(
                      context,
                      bgColor: AppColor.primaryColor,
                      textColor: AppColor.white,
                      onTap: () {
                        nextPage(context, page: const EditProfile());
                      },
                      text: 'SAVE CHANGES',
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
