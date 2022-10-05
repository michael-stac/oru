import 'package:flutter/material.dart';

import '../../../Utils/router.dart';
import '../../../Widgets/custom_button.dart';
import '../../Styles/colors.dart';
import 'edit_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: BackButton(color: AppColor.black,),

      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile ",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColor),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/Ellipse.png')),
                      const SizedBox(height: 10),
                      Text(
                        'Aiby Arena',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor),
                      ),
                      Text(
                        'Event Center',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.oldSilver),
                      ),
                      const SizedBox(height: 24),
                      customButton(
                        context,
                        bgColor: AppColor.primaryColor,
                        textColor: AppColor.white,
                        onTap: () {
                          nextPage(context, page: const EditProfile());
                        },
                        text: 'Edit Account',
                      ),
                      const SizedBox(height: 40),
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
                                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.gray),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                                )
                              ),
                              

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
                                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.gray),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  )
                              ),

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
                                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.gray),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  )
                              ),

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
                                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.gray),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  )
                              ),

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
                                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.gray),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  )
                              ),

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
                            child: const Text(
                              "Achievement Level",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 65),
                            child: Text(
                              "Emerald",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.gray),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

