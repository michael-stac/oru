import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    initalizeUser();
    navigate();
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
  initalizeUser() {
    log('User in Splash ${FirebaseAuth.instance.currentUser.toString()}');
  }

  // TODO: has user seen onboarding screen

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      nextPageOnly(context, page: Intro());
    });
  }
}
