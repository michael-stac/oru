import 'package:flutter/material.dart';

import '../../../Widgets/custom_button.dart';
import '../../Styles/colors.dart';

class ApplocationProfile extends StatefulWidget {
  const ApplocationProfile({Key? key}) : super(key: key);

  @override
  State<ApplocationProfile> createState() => _ApplocationProfileState();
}

class _ApplocationProfileState extends State<ApplocationProfile> {
  @override
  Widget build(BuildContext context) {
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
              padding:  EdgeInsets.symmetric(horizontal: 22, vertical: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Image(image: AssetImage("assets/images/wisdom.png")),
                        Text(
                          "Wisdom Nwo..",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Backend developer",
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.gray,
                            fontWeight: FontWeight.bold),
                      ),
                      const Image(image: AssetImage("assets/images/tick.png"))
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Edit",
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
                        padding: const EdgeInsets.all(12),
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
                        child: const Text(
                            "Creative UX Designer with 6+ years of experience in optimizing user experience through innovative solutions and dynamic interface designs. Successful in enhancing user engagement for well-known brands, providing a compelling user experience to improve brand loyalty and customer retention. ", style: TextStyle(fontSize: 14,  fontWeight: FontWeight.w900, color: Colors.grey),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
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
                  const SizedBox(height: 10,),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(12),
                      leading: const Image(image: AssetImage("assets/images/olutu.png")),
                      title: Text(
                        "UX Intern",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
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
                  const SizedBox(height: 20,),
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
                  const SizedBox(height: 10,),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(12),
                      leading: const Image(image: AssetImage("assets/images/uni.png")),
                      title: Text(
                        "Computer Science",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
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
                  const SizedBox(height: 20,),
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
                  const SizedBox(height: 20,),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(12),
                      leading: const Image(image: AssetImage("assets/images/pot.png")),
                      title: Text(
                          "Resume",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "About Gloria Ojukwu",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: Colors.grey),
                      ),

                    ),
                  ),
                  const SizedBox(height: 20,),
                  customButton(context,
                      textColor: AppColor.white,
                      bgColor: AppColor.primaryColor,
                      onTap: () {}, text: 'Submit')

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
