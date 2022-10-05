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
    navigate();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  AppColor.white,
      body  : const Center(
        child: Image(image: AssetImage("assets/images/logo.png"),),
      ),
    );
  }

  void navigate() {
    Future.delayed( const Duration(seconds: 3), () {
    nextPageOnly(context, page:  Intro());

    });
  }
}
