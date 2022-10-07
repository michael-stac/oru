import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:gigi/Widgets/custom_button.dart';

import '../../../Styles/colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        leading: GestureDetector(
          onTap: () {},
          child: const Image(
            image: AssetImage("assets/images/leading_back.png"),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColor.primaryColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor.primaryColor),
                    ),
                  ),
                  CustomTextField(
                    _oldPassword,
                    hint: "Enter your old Password",
                    password: false,
                    backgroundColor: Colors.transparent,
                    border: Border.all(color: AppColor.gray),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Enter new password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor.primaryColor),
                    ),
                  ),
                  CustomTextField(
                    _newPassword,
                    hint: "Enter new password",
                    password: false,
                    backgroundColor: Colors.transparent,
                    border: Border.all(color: AppColor.gray),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Confirm ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor.primaryColor),
                    ),
                  ),
                  CustomTextField(
                    _confirmNewPassword,
                    hint: "Confirm new password",
                    password: false,
                    backgroundColor: Colors.transparent,
                    border: Border.all(color: AppColor.gray),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  customButton(context, onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            "assets/images/done.png")),
                                    const SizedBox(
                                      height: 42.84,
                                    ),
                                    const Text(
                                      "Are you sure ?",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Are you sure you want to Log out?",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    customButton(context, onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Image(
                                                          image: AssetImage(
                                                              "assets/images/done.png")),
                                                      const SizedBox(
                                                        height: 42.84,
                                                      ),
                                                      const Text(
                                                        "Successful ?",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      const Text(
                                                        "You’ve successfully applied changed your password.?",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.grey),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      customButton(context,
                                                          onTap: () {},
                                                          text: 'Yes',
                                                          textColor:
                                                              Colors.white,
                                                          bgColor: AppColor
                                                              .primaryColor),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border.all(
                                                                      color: AppColor
                                                                          .primaryColor,
                                                                      width: 2),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            18),
                                                                  )),
                                                          child: Text(
                                                            "No",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppColor
                                                                    .primaryColor,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                        text: 'Yes',
                                        textColor: Colors.white,
                                        bgColor: AppColor.primaryColor),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColor.primaryColor,
                                                width: 2),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(18),
                                            )),
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.primaryColor,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                      textColor: AppColor.white,
                      bgColor: AppColor.primaryColor,
                      text: 'Reset Your Password')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
