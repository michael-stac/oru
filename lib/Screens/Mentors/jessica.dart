import 'package:flutter/material.dart';
import 'package:gigi/Utils/router.dart';

import '../../../Widgets/custom_button.dart';
import '../Courses/couses.dart';
import '../Styles/colors.dart';

class JessicaMentor extends StatefulWidget {
  const JessicaMentor({Key? key}) : super(key: key);

  @override
  State<JessicaMentor> createState() => _JessicaMentorState();
}

class _JessicaMentorState extends State<JessicaMentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.white,
       leading: BackButton(color: AppColor.black,),
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
                        const Image(
                            image:
                            AssetImage("assets/images/mentor.png")),
                        Text(
                          "Haley Jessica",
                          style: TextStyle(
                              fontSize: 20,
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
                        "UX Designer",
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

                            const Text(
                              "Employed",
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
                  Text(
                    "Tech used",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Figma",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColor.gray,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Adobe XD",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColor.gray,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Photoshop",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColor.gray,
                              fontWeight: FontWeight.bold),
                        ),


                      ],
                    ),
                  ),
                  Text(
                    "Portfolio",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      Image(image: AssetImage("assets/images/better.png")),
                      Image(image: AssetImage("assets/images/unix.png")),
                      Image(image: AssetImage("assets/images/better.png")),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  customButton(context,
                      textColor: AppColor.white,
                      bgColor: AppColor.primaryColor,
                      onTap: () {
                    nextPage(context, page:  Lesson());

                      }, text: 'Proceed')

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
