import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gigi/Providers/db_provider.dart';
import 'package:gigi/main_activity.dart';
import 'package:provider/provider.dart';

import 'Screens/Styles/colors.dart';
import 'Screens/boardingPackage/intro_page.dart';
import 'Utils/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initalizeUser().then((value) => navigate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: const Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }

  // TODO: implement init users
  Future initalizeUser() async {
    final dbProvider = Provider.of<DbProvider>(context, listen: false);
    if (FirebaseAuth.instance.currentUser != null) {
      await dbProvider.setCurrentUser();
    }
  }

  // TODO: has user seen onboarding screen

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser == null) {
        nextPageOnly(context, page: Intro());
      } else {
        nextPageOnly(context, page: MainActivityPage());
      }
    });
  }
}
