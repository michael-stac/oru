import 'package:flutter/material.dart';

import '../../../Widgets/custom_button.dart';
import '../../Styles/colors.dart';

class Applications extends StatefulWidget {
  const Applications({Key? key}) : super(key: key);

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const  Text(
          "Mentorship Hub",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Select a profile",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 185,
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 120, top: 19),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: _value
                                            ? const Icon(
                                                Icons.check,
                                                size: 10.0,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.check_box_outline_blank,
                                                size: 10.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  )),
                              const Image(
                                  image:
                                      AssetImage("assets/images/mentor.png")),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Haley Jessica",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "UX Designer",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColor.gray,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Image(
                                      image:
                                          AssetImage("assets/images/tick.png"))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 185,
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 120, top: 19),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                          Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: _value
                                            ? const Icon(
                                          Icons.check,
                                          size: 10.0,
                                          color: Colors.white,
                                        )
                                            : const Icon(
                                          Icons.check_box_outline_blank,
                                          size: 10.0,
                                          color: Color(0xff5386E4),
                                        ),
                                      ),
                                    ),
                                  )),
                              const Image(
                                  image:
                                      AssetImage("assets/images/richard.png")),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Richard Tams",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Front end Developer",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColor.gray,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Image(
                                      image:
                                          AssetImage("assets/images/tick.png"))
                                ],
                              )
                            ],
                          ),
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
                      SizedBox(
                        width: 185,
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 120, top: 19),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: _value
                                            ? const Icon(
                                                Icons.check,
                                                size: 10.0,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.check_box_outline_blank,
                                                size: 10.0,
                                                color: Color(0xff5386E4),
                                              ),
                                      ),
                                    ),
                                  )),
                              const Image(
                                  image:
                                      AssetImage("assets/images/wisdom.png")),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Wisdom Nwo..",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9,),
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
                                  const Image(
                                      image:
                                          AssetImage("assets/images/tick.png"))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 185,
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 120, top: 19),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                          Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: _value
                                            ? const Icon(
                                          Icons.check,
                                          size: 10.0,
                                          color: Colors.white,
                                        )
                                            : const Icon(
                                          Icons.check_box_outline_blank,
                                          size: 10.0,
                                          color: Color(0xff5386E4),
                                        ),
                                      ),
                                    ),
                                  )),
                              const Image(
                                  image:
                                      AssetImage("assets/images/gills.png")),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Sokari Gills",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Data Scientist",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColor.gray,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Image(
                                      image:
                                          AssetImage("assets/images/tick.png"))
                                ],
                              )
                            ],
                          ),
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
                      SizedBox(
                        width: 185,
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 120, top: 19),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                          Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: _value
                                            ? const Icon(
                                          Icons.check,
                                          size: 10.0,
                                          color: Colors.white,
                                        )
                                            : const Icon(
                                          Icons.check_box_outline_blank,
                                          size: 10.0,
                                          color: Color(0xff5386E4),
                                        ),
                                      ),
                                    ),
                                  )),
                              const Image(
                                  image:
                                      AssetImage("assets/images/ebun.png")),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Cynthia Ebun",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Project Manager",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColor.gray,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Image(
                                      image:
                                          AssetImage("assets/images/tick.png"))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 185,
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 25.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 120, top: 19),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                          Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: _value
                                            ? const Icon(
                                          Icons.check,
                                          size: 10.0,
                                          color: Colors.white,
                                        )
                                            : const Icon(
                                          Icons.check_box_outline_blank,
                                          size: 10.0,
                                          color: Color(0xff5386E4),
                                        ),
                                      ),
                                    ),
                                  )),
                              const Image(
                                  image:
                                      AssetImage("assets/images/muna.png")),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Mercy Muna",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Product Manager",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColor.gray,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Image(
                                      image:
                                          AssetImage("assets/images/tick.png"))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
