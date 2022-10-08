import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:image_picker/image_picker.dart';


import '../../../Utils/image_picker.dart';
import '../../../Widgets/custom_button.dart';
import '../../Styles/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _gender = TextEditingController();

  String path = '';
  bool isVisible = false;

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
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          context: context,
                          builder: (context) => Container(
                            color: Colors.transparent,
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
                                              setState(() {});
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
                                              .pickCamera(
                                              source: ImageSource.gallery)
                                              .then((value) {
                                            if (value != '') {
                                              path = value;
                                              setState(() {});
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create a Profile',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Complete your registration to continue',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Contact information',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),


                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            "Gender",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        CustomTextField(
                          _gender,
                          hint: "Your address",
                          password: false,
                          backgroundColor: Colors.transparent,
                          border: Border.all(color: AppColor.gray),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            "Address",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        CustomTextField(
                          _address,
                          hint: "Your address",
                          password: false,
                          backgroundColor: Colors.transparent,
                          border: Border.all(color: AppColor.gray),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            "City",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        CustomTextField(
                          _city,
                          hint: "Your city",
                          password: false,
                          backgroundColor: Colors.transparent,
                          border: Border.all(color: AppColor.gray),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            "State/Province",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        CustomTextField(
                          _province,
                          hint: "Your city",
                          password: false,
                          backgroundColor: Colors.transparent,
                          border: Border.all(color: AppColor.gray),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            "Country",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        CustomTextField(
                          _country,
                          hint: "Your city",
                          password: false,
                          backgroundColor: Colors.transparent,
                          border: Border.all(color: AppColor.gray),
                        ),



                        const SizedBox(height: 20)
                      ],
                    ),
                    const SizedBox(height: 40),
                    customButton(
                      context,
                      bgColor: AppColor.primaryColor,
                      textColor: AppColor.white,
                      onTap: () {},
                      text: 'SAVE CHANGES',
                    ),
                    const SizedBox(height: 30,),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
