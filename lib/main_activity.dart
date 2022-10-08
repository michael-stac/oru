import 'package:flutter/material.dart';
import 'package:gigi/Screens/BottomNavPages/Settings/settings.dart';
import 'package:gigi/Utils/router.dart';
import 'package:gigi/add_job_page.dart';

import 'package:provider/provider.dart';

import 'Providers/bottom_nav_provider.dart';
import 'Screens/BottomNavPages/Applcations/application.dart';
import 'Screens/BottomNavPages/Home/home.dart';
import 'Screens/BottomNavPages/ReviewPage/reviewpage.dart';
import 'Screens/Styles/colors.dart';

class MainActivityPage extends StatefulWidget {
  const MainActivityPage({Key? key}) : super(key: key);

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  ///bottom nav items
  List<Map>? bottomNavItems = [
    {'title': 'Home', 'icon': 'assets/images/home.png'},
    {'title': "Drop Point", 'icon': 'assets/images/map.png'},
    {'title': "Activity", 'icon': 'assets/images/clock.png'},
    {'title': "Setting", 'icon': 'assets/images/setting.png'},
  ];

  ///bottom nav pages
  List<Widget> bottomNavPages = [
    const HomePage(),
    const Applications(),
    const ReviewPage(),
    const SettingsPage()
  ];

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  void openDrawer() {
    drawerKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProviders>(builder: (context, counter, child) {
      return Scaffold(
        backgroundColor: AppColor.white,
        appBar: counter.bottomCounter != 0
            ? null
            : AppBar(
                elevation: 0,
                titleSpacing: 0,
                backgroundColor: Colors.grey[200],
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                      onPressed: () => nextPage(context, page: AddJobPage()),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications,
                        color: AppColor.quickSilver,
                      ),
                    ),
                  )
                ],
              ),
        body: bottomNavPages[counter.bottomCounter],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              counter.changeCounter(value);
            },
            currentIndex: counter.bottomCounter,
            items: List.generate(bottomNavItems!.length, (index) {
              final data = bottomNavItems![index];

              return BottomNavigationBarItem(
                  tooltip: data['title'],
                  icon: Column(children: [
                    Image.asset(
                      data['icon'],
                      width: 20,
                      color: counter.bottomCounter == index
                          ? AppColor.primaryColor
                          : AppColor.gray,
                    ),
                    // const SizedBox(height: 5),
                    // if (counter.bottomCounter == index)
                    //   Container(
                    //     height: 4,
                    //     width: 20,
                    //     color: AppColor.white,
                    //   ),
                  ]),
                  label: data['title']);
            })),
      );
    });
  }
}
