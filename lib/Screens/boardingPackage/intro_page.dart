import 'package:flutter/material.dart';
import 'package:gigi/Screens/boardingPackage/page.dart';

import '../../Utils/router.dart';
import '../Authentication/register.dart';
import 'boarding_screen.dart';


class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final List<Pages> boardingPages = <Pages>[
    Pages(
      title: 'Mak your Career',
      description:
          "Figure out your top five priorities whether it is company culture, salary.",
      imagePath: 'assets/images/onboarding_one.png',
    ),
    Pages(
      title: 'Search your dream job fast and ease',
      description: 'Figure out your top five priorities -- whether it is company culture, salary or a specific job position.  ',
      imagePath: 'assets/images/onboarding_two.png',
    ),
    Pages(
      title: 'Make your dream career with job',
      description: "We help you find your dream job according to your skillset, location & preference to build your career.",
      imagePath: 'assets/images/onboarding_three.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return OnBoardingPage(
      boardingPages,
      appName: '',
      skip: () {
        nextPageAndRemovePrevious(context, page: const RegisterPage());
      },
      continueProcess: () {
        nextPageAndRemovePrevious(context, page: const RegisterPage());
      },
    );
  }
}
