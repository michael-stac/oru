import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import '../Screens/Styles/colors.dart';



class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),

                const SizedBox(
                  height: 20,
                ),
                DropDownTextField(
                  clearOption: true,
                  textFieldDecoration:InputDecoration(
                    contentPadding:  const EdgeInsets.all(0),
                    focusedBorder: OutlineInputBorder(
                        borderSide:   BorderSide(
                          color: AppColor.quickSilver,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14)),

                    enabledBorder: OutlineInputBorder(
                        borderSide:   BorderSide(
                          color: AppColor.quickSilver,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14)),

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
        ),
      ),

    );
  }
}