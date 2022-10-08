import 'package:flutter/material.dart';
import '../Styles/colors.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available Courses",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                Text(
                  "UI/UX Design",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.gray,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/figma.png")),
                      title: Text(
                        "UI/UX Designer",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),
                SizedBox(height: 15,),
                Text(
                  "Mobile Development",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.gray,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/flutter.png")),
                      title: Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/ios.png")),
                      title: Text(
                        "Swift",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/dart.png")),
                      title: Text(
                        "Dart For Flutter",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),
                SizedBox(height: 20,),
                Text(
                  "Front-End",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.gray,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/js.png")),
                      title: Text(
                        "JavaScript",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/react.png")),
                      title: Text(
                        "React",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(4),
                      leading: const Image(image: AssetImage("assets/images/vue.png")),
                      title: Text(
                        "Vue.Js",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:  const Text(
                        "Basic to Advance",
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
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "",
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
                ),

              ],
            ),
          ),
        )
      ],
      ),
    );
  }
}
