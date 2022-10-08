import 'package:flutter/material.dart';
import 'package:gigi/Widgets/custom_button.dart';

import '../../../Utils/router.dart';
import '../../../main_activity.dart';
import '../../Styles/colors.dart';

class JobType extends StatefulWidget {
  const JobType({Key? key}) : super(key: key);

  @override
  State<JobType> createState() => _JobTypeState();
}

class _JobTypeState extends State<JobType> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        leading: BackButton(color: AppColor.black,),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "What type of job you're looking for",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 60),
                    Container(
                      margin: const EdgeInsets.only(right: 30, left: 30),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/fulltime.png',
                                  height: 25,
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  'Full - Time',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const Spacer(),
                                const Icon(Icons.circle_outlined)
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/fulltime.png',
                                height: 25,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'Part - Time',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              const Icon(Icons.circle_outlined)
                            ],
                          ),
                          const SizedBox(height: 40),
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/contract.png',
                                  height: 25,
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  'Contract',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const Spacer(),
                                GestureDetector(onTap: (){
                                  setState(() {
                                    isSelected = !isSelected;
                                  });
                                } ,child: isSelected ? const Icon(Icons.circle_outlined) : const Icon(Icons.check_circle, color: Colors.blue,))
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/fulltime.png',
                                  height: 25,
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  'Internship',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const Spacer(),
                                const Icon(Icons.circle_outlined)
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/fulltime.png',
                                height: 25,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'Freelance',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              const Icon(Icons.circle_outlined)
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                    customButton(context, onTap: (){
                      nextPage(context, page: const MainActivityPage());
                    }, text: 'SAVE CHANGES', bgColor: isSelected? Colors.blueGrey : AppColor.blue, textColor: Colors.white),
                    const SizedBox(height: 70),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}