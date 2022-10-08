import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:gigi/Screens/otp_page.dart';
import 'package:gigi/Services/auth_service.dart';
import 'package:gigi/Services/otp_service.dart';
import 'package:gigi/Widgets/custom_notification.dart';

import '../../Providers/authentication_provider.dart';
import '../../Utils/router.dart';

import '../../Widgets/custom_button.dart';
import '../../Widgets/social_button.dart';
import '../../main_activity.dart';
import '../Styles/colors.dart';

import 'CreateProfile/profile.dart';
import 'JobSearch/job_time.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isChecked = false;

  //Color Instance

  ///Text Feild controllers
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  ///Form Key
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height - 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
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
                              "Sign Up",
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
                              "Sign up to start your wonderfull journey",
                              // textAlign: TextAlign.center,
                              style: TextStyle(color: AppColor.gray),
                            ),

                            const SizedBox(
                              height: 35,
                            ),
                            //Social buttons
                          ],
                        ),

                        //Username
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text(
                                "Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            CustomTextField(
                              _username,
                              hint: "Your name",
                              password: false,
                              backgroundColor: Colors.transparent,
                              border: Border.all(color: AppColor.gray),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
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

                        //Password
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
                              hint: "Minimum 8 letters",
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
                                "Confirm Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            CustomTextField(
                              _password,
                              hint: "Minimum 8 letters",
                              backgroundColor: Colors.transparent,
                              border: Border.all(color: AppColor.gray),
                            ),
                          ],
                        ),

                        //Agreement?
                        CheckboxListTile(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Accept ",
                                style: TextStyle(
                                    color: AppColor.black, fontSize: 16)),
                            TextSpan(
                                text: "Terms & Privacy Policy",
                                style: TextStyle(
                                    color: AppColor.blue, fontSize: 16))
                          ])),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //RegisterPage Button
                        customButton(
                          isLoading: isLoading,
                          context,
                          text: 'SIGN UP',
                          textColor: AppColor.white,
                          onTap: () {
                            nextPage(context, page: JobType());
                          },
                          bgColor: AppColor.primaryColor,
                        ),

                        //Already have an account
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    color: AppColor.black, fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    nextPage(context, page: const LoginPage());
                                  },
                                  child: Text("Login",
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
                                  // onTap: () {
                                  //   AuthenticationProvider()
                                  //       .signInWithGoogle()
                                  //       .then((value) {
                                  //     if (value.user != null) {
                                  //       nextPageAndRemovePrevious(context,
                                  //           page: const MainActivityPage());
                                  //     } else {
                                  //       error(context,
                                  //           message: "Please Try Again...");
                                  //     }
                                  //   });
                                  // },
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

  void _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!_isChecked) {
      showCustomNotification(context, 'Agree to terms and coditions');
      return;
    }

    setState(() => isLoading = true);
    final status = await FAuth.signUpWithEmailAndPassword(
      email: _email.text.trim(),
      password: _password.text.trim(),
      name: _username.text.trim(),
    );

    showCustomNotification(context, status.message);
    if (status.isSuccess) {
      await OtpService.sendOtp(userEmail: _email.text.trim());
      showCustomNotification(context, 'Otp has been sent to your email');
      nextPage(context, page: OtpPage(userId: status.content));
    }
    setState(() => isLoading = false);
  }
}
