import 'dart:developer';

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:gigi/Models/user_model.dart';
import 'package:gigi/Providers/db_provider.dart';
import 'package:gigi/Services/db_service.dart';
import 'package:gigi/Services/storage_service.dart';
import 'package:gigi/Utils/db_constants.dart';
import 'package:gigi/Widgets/custom_notification.dart';
import 'package:gigi/Widgets/custom_text_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/custom_button.dart';
import 'Styles/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DbProvider>(context).currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Edit",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 23),
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FDatabase.getUserSettings(user.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.active) {
                      final mainP = snapshot.data!.get(DbConstants.mainProfile);

                      final mainProfile = UserMainProfile(
                          about: mainP[DbConstants.about],
                          imgUrl: mainP[DbConstants.profilePic]);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 130,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 3,
                                                color: Colors.grey
                                                    .withOpacity(0.4))
                                          ]),
                                      child: mainProfile.imgUrl == ''
                                          ? null
                                          : CachedNetworkImage(
                                              imageUrl: mainProfile.imgUrl,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 15,
                                      child: GestureDetector(
                                        onTap: () =>
                                            _handleSelectImage(user.id),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: AppColor.primaryColor,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  user.name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 9),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user.email,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: AppColor.gray,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 4),
                              const Image(
                                  image: AssetImage("assets/images/tick.png"))
                            ],
                          ),
                          const SizedBox(height: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "About",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () => _handleAbout(
                                        user.id, mainProfile.about),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: AppColor.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 10.0,
                                      )
                                    ]),
                                child: Text(
                                  mainProfile.about,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "See all",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 10.0,
                                  )
                                ]),
                            child: ListTile(
                              tileColor: Colors.white38,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.all(12),
                              leading: const Image(
                                  image: AssetImage("assets/images/olutu.png")),
                              title: Text(
                                "UX Intern",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                "Olotu Square",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Port Harcourt, NG",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Dec 20 - Feb 21",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Education",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "See all",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 10.0,
                                  )
                                ]),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.all(12),
                              leading: const Image(
                                  image: AssetImage("assets/images/uni.png")),
                              title: Text(
                                "Computer Science",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                "Bachelor | Uniport",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Choba",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "2017 - 2020",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Resume",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Edit ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 10.0,
                                  )
                                ]),
                            child: ListTile(
                              tileColor: Colors.white38,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.all(12),
                              leading: const Image(
                                  image: AssetImage("assets/images/pot.png")),
                              title: Text(
                                "Resume",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                "About Gloria Ojukwu",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customButton(context,
                              textColor: AppColor.white,
                              bgColor: AppColor.primaryColor,
                              onTap: () {},
                              text: 'Submit')
                        ],
                      );
                    }
                    return CupertinoActivityIndicator(
                        color: AppColor.primaryColor);
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _handleAbout(String id, String prvText) {
    final aboutC = TextEditingController();
    aboutC.text = prvText;
    showDialog(
        context: context,
        builder: (_) {
          bool isLoading = false;

          return Dialog(
            child: StatefulBuilder(builder: (ctx, setS) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customTextField(
                      controller: aboutC,
                      hint: 'Express Yourself',
                      title: 'Add your bio',
                      maxLines: 4,
                    ),
                    SizedBox(height: 20),
                    customButton(
                      context,
                      onTap: () async {
                        setS(() => isLoading = true);
                        await FDatabase.addPofileS(
                          context: context,
                          id: id,
                          key: DbConstants.about,
                          value: aboutC.text,
                        );

                        setS(() => isLoading = false);
                        Navigator.pop(ctx);
                      },
                      isLoading: isLoading,
                      text: 'Save bio',
                      bgColor: AppColor.primaryColor,
                      textColor: AppColor.white,
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  void _handleSelectImage(String userId) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _pickImage(0, userId);
                Navigator.pop(ctx);
              },
              icon: Icon(Icons.photo),
            ),
            Container(
              width: 1,
              height: 15,
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {
                _pickImage(1, userId);
                Navigator.pop(ctx);
              },
              icon: Icon(Icons.camera_alt),
            )
          ],
        ),
      ),
    );
  }

  _pickImage(int type, String userId) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
        source: type == 0 ? ImageSource.gallery : ImageSource.camera);
    if (image == null) {
      showCustomNotification(context, 'Plese Select again');
      return;
    }
    final imageFile = File(image.path);
    log('Image Path ${image.name}');
    final sr = await FStorage.uploadImage(userId, imageFile);
    log('Sr $sr');
    if (sr == 'null') {
      showCustomNotification(context, 'Plese Select again');
      return;
    }

    await FDatabase.addPofileS(
        context: context, id: userId, key: DbConstants.profilePic, value: sr);

    await Provider.of<DbProvider>(context, listen: false).setCurrentUser();
  }
}
