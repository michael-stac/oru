import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';

import 'package:provider/provider.dart';


import '../../Utils/message.dart';
import '../../Utils/router.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/social_button.dart';
import '../../Providers/authentication_provider.dart';
import '../Styles/colors.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

  //Color Instance

  ///Text Feild controllers
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  ///Form Key
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height - 20,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      primary: true,
                      children: [
                        ///Logo and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Sign in to be a part of a clean plastic-free environment",
                              // textAlign: TextAlign.center,
                              style: TextStyle(color: AppColor.gray),
                            ),

                            const SizedBox(
                              height: 35,
                            ),
                            //Social buttons
                          ],
                        ),

                        //Email
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text(
                                "Email Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            CustomTextField(
                              _email,
                              hint: "Email@email.com",
                              password: false,
                              backgroundColor: Colors.transparent,
                              border: Border.all(color: AppColor.gray),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            CustomTextField(
                              _password,
                              hint: "**********",
                              backgroundColor: Colors.transparent,
                              border: Border.all(color: AppColor.gray),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        //Forgot Password??
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Forgot Password?",
                                  style: TextStyle(
                                      color: AppColor.blue, fontSize: 16))
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //LoginPage Button
                        customButton(
                          context,
                          text: 'SIGN IN',
                          textColor: AppColor.white,
                          bgColor: AppColor.primaryColor,
                          onTap: () {

                          },


                        ),



                        //Already have an account
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    color: AppColor.black, fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    nextPage(context,
                                        page: const RegisterPage());
                                  },
                                  child: Text("Sign up",
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 16))),
                            ],
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            "You can also sign up with",
                            style:
                                TextStyle(color: AppColor.gray, fontSize: 10),
                          ),
                        ),

                        Container(
                          child: Column(
                            children: [
                              SocialButton(
                                 onTap: () {},
                                  text: "Google",
                                  icon: Image.asset(
                                    "assets/images/google.png",
                                    width: 25,
                                  )),
                              SocialButton(
                                  text: "Facebook",
                                  icon: Image.asset(
                                    "assets/images/linkdin.png",
                                    width: 25,
                                  )),
                              const SizedBox(
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showResponseMessage(
      AuthenticationProvider authProvider, BuildContext context) {
    Widget? widget;
    if (authProvider.resMessage != "") {
      if (authProvider.resMessage == "Account created!") {
        ///Authentication was successful
        ///Navigate user to Home page
        widget = Text("");

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // PageNavigator(context: context)
          //     .nextPageAndUntil(page: MainActivity());
        });
      } else if (authProvider.resMessage == "Please wait !") {
        widget = Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor,
            ),
            child: Text(
              authProvider.resMessage,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
            ));
      } else {
        widget = Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.red,
            ),
            child: Text(
              authProvider.resMessage,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
            ));
      }
    } else {
      widget = Text("");
    }
    return widget;
  }
}
