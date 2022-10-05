import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';

import '../../../Utils/router.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_text_formfield.dart';
import '../../../main_activity.dart';
import '../../BottomNavPages/Home/home.dart';
import '../../Styles/colors.dart';



class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  ///Text Feild controllers
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _businessName = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final TextEditingController _businessSector = TextEditingController();



  ///Form Key
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isVisible = false;
  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override

  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColor.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create a Profile',
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Complete your registration to continue',
                    style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Select an account type',
                    style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isVisible = false;
                              },
                            );
                          },
                          child: isVisible
                              ? const Icon(Icons.circle_outlined)
                              : const Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                )),
                      const SizedBox(width: 10),
                      Text(
                        'Individual',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = true;
                          });
                        },
                        child: isVisible
                            ? const Icon(
                                Icons.circle,
                                color: Colors.green,
                              )
                            : const Icon(Icons.circle_outlined),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Business',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40,
                    color: AppColor.Gainsboro,
                    thickness: 0.5,
                  ),
                  Text(
                    'User information',
                    style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "Occupation Status",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDownTextField(
                          clearOption: true,
                          textFieldDecoration:InputDecoration(
                            hintStyle: TextStyle(fontSize: 12, color: AppColor.quickSilver),

                            hintText: '-select ocupatiion status-',
                            contentPadding:  const EdgeInsets.all(17),
                            focusedBorder: OutlineInputBorder(
                                borderSide:   BorderSide(
                                  color: AppColor.quickSilver,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),

                            enabledBorder: OutlineInputBorder(
                                borderSide:   BorderSide(
                                  color: AppColor.quickSilver,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),

                          ) ,
                          textFieldFocusNode: textFieldFocusNode,
                          searchFocusNode: searchFocusNode,
                          // searchAutofocus: true,
                          dropDownItemCount: 8,
                          searchShowCursor: false,
                          enableSearch: false,
                          searchKeyboardType: TextInputType.text,
                          dropDownList: const [
                            DropDownValueModel(name: 'name5', value: "value5"),
                            DropDownValueModel(name: 'name6', value: "value6"),
                            DropDownValueModel(name: 'name7', value: "value7"),
                            DropDownValueModel(name: 'name8', value: "value8"),
                          ],
                          onChanged: (val) {},
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "Gender",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDownTextField(
                          clearOption: true,
                          textFieldDecoration:InputDecoration(
                            hintStyle: TextStyle(fontSize: 12, color: AppColor.quickSilver),

                            hintText: '-select gender-',
                            contentPadding:  const EdgeInsets.all(17),
                            focusedBorder: OutlineInputBorder(
                                borderSide:   BorderSide(
                                  color: AppColor.quickSilver,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),

                            enabledBorder: OutlineInputBorder(
                                borderSide:   BorderSide(
                                  color: AppColor.quickSilver,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),

                          ) ,
                          textFieldFocusNode: textFieldFocusNode,
                          searchFocusNode: searchFocusNode,
                          // searchAutofocus: true,
                          dropDownItemCount: 8,
                          searchShowCursor: false,
                          enableSearch: false,
                          searchKeyboardType: TextInputType.text,
                          dropDownList: const [
                            DropDownValueModel(name: 'name5', value: "value5"),
                            DropDownValueModel(name: 'name6', value: "value6"),
                            DropDownValueModel(name: 'name7', value: "value7"),
                            DropDownValueModel(name: 'name8', value: "value8"),
                          ],
                          onChanged: (val) {},
                        ),

                      ],
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Divider(
                      height: 40,
                      color: AppColor.Gainsboro,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: isVisible,
                    child: Text(
                      'Business Information',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: const SizedBox(height: 24),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "Business Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Visibility(
                      visible: isVisible,
                      child:  CustomTextField(
                        _businessName,
                        hint: "Your business name",
                        password: false,
                        backgroundColor: Colors.transparent,
                        border: Border.all(color: AppColor.gray),
                      ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: const SizedBox(height: 10),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: customTextField(
                      title: 'Business Sector',
                      hintText: 'Event Center',
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: AppColor.Gainsboro,
                    thickness: 0.5,
                  ),

                  // const SizedBox(height: 20),
                  Text(
                    'Contact information',
                    style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "Address",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  CustomTextField(
                    _address,
                    hint: "Your address",
                    password: false,
                    backgroundColor: Colors.transparent,

                    border: Border.all(color: AppColor.gray),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "City",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  CustomTextField(
                    _city,
                    hint: "Your city",
                    password: false,
                    backgroundColor: Colors.transparent,


                    border: Border.all(color: AppColor.gray),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "State/Province",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  CustomTextField(
                    _province,
                    hint: "Rivers",
                    readOnly: true,
                    password: false,
                    backgroundColor: AppColor.gray,

                    border: Border.all(color: AppColor.gray),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "Country",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  CustomTextField(
                    _country,
                    hint: "Nigeria",
                    readOnly: true,
                    password: false,
                    backgroundColor: AppColor.gray,

                    border: Border.all(color: AppColor.gray),
                  ),

                  const SizedBox(
                    height: 56,
                  ),
                  customButton(
                    bgColor: AppColor.primaryColor,
                    context,
                    onTap: () {
                      nextPage(context, page:  MainActivityPage());

                    },
                    text: 'SAVE CHANGES',
                    textColor: AppColor.white
                  ),

                  const SizedBox(height: 20)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
