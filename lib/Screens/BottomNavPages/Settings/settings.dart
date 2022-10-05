import 'package:flutter/material.dart';

import '../../Styles/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: const Image(image: AssetImage("assets/images/leading_back.png"),),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                 Text("Applications ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                 SizedBox(height: 21,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/pro.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Profile Visibility", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/notification.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Notification", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/change.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Change Password", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/theme.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Theme", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/deletes.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Delete Account", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Text("About ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                SizedBox(height: 21,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/privacy.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Privacy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/terms.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Notification", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/change.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Change Password", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children:  const [
                    Image(image: AssetImage("assets/images/theme.png")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Theme", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

              ],

            ),
          ),
          )
        ],
      ),
    );
  }
}
