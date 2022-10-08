import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:gigi/Models/job_model.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:gigi/Services/db_service.dart';
import 'package:gigi/Widgets/custom_button.dart';
import 'package:gigi/Widgets/custom_notification.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key});

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  TextEditingController title = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController salaryPerHour = TextEditingController();
  TextEditingController jobType = TextEditingController();
  // TextEditingController companyLogo = TextEditingController();

  List<String> requirements = [];

  List<String> brands = ['Nike', 'Google', 'Uber', 'Apple', 'Amazon'];
  List<String> brandLogo = [
    "assets/images/nike.png",
    "assets/images/google.png",
    "assets/images/uber.png",
    "assets/images/apple.png",
    "assets/images/amazon.jpg"
  ];
  // TextEditingController homeScreenRole = TextEditingController();
  String? selectedBrand;
  int? selectedIndex;
  bool isRecomended = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: AppColor.black)),
        centerTitle: true,
        title: Text('Add Job', style: TextStyle(color: AppColor.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            TitleAndtextForm(title: 'Title', controller: title),
            const SizedBox(height: 15),
            TitleAndtextForm(title: 'Company Name', controller: companyName),
            const SizedBox(height: 15),
            TitleAndtextForm(title: 'Job Location', controller: location),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButton(
                      value: selectedBrand,
                      hint: Text('Select Company'),
                      items: brands
                          .map((brand) => DropdownMenuItem(
                                value: brand,
                                child: Text(
                                  brand,
                                ),
                              ))
                          .toList(),
                      onChanged: (brand) {
                        log(brand.toString());
                        setState(() {
                          selectedBrand = brand as String;
                          selectedIndex = brands.indexOf(brand);
                        });
                        log(selectedIndex.toString());
                      }),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text('Logo Preview'),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 232, 232),
                        shape: BoxShape.circle,
                      ),
                      child: selectedIndex != null
                          ? Image.asset(
                              brandLogo[selectedIndex as int],
                              fit: BoxFit.fitWidth,
                            )
                          : null,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            TitleAndtextForm(
                title: 'Salary per hour', controller: salaryPerHour),
            const SizedBox(height: 15),
            TitleAndtextForm(title: 'Job Type', controller: jobType),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                    value: isRecomended,
                    onChanged: (val) {
                      setState(() => isRecomended = val as bool);
                    }),
                const Text('Recomended  Product')
              ],
            ),
            const SizedBox(height: 10),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Requirements',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )),
            const SizedBox(height: 10),
            Container(
              constraints: const BoxConstraints(maxHeight: 100),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: requirements
                      .map((e) => Text('${requirements.indexOf(e) + 1}.  $e'))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _showCriteriaModal,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primaryColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text('Add Requirements'),
                ],
              ),
            ),
            const SizedBox(height: 25),
            customButton(
              context,
              onTap: _addJobToDb,
              text: 'Add Job',
              bgColor: AppColor.primaryColor,
              textColor: AppColor.white,
              isLoading: isLoading,
            ),
            const SizedBox(height: 15),
          ],
        ),
      )),
    );
  }

  void _addJobToDb() async {
    final role = isRecomended ? HomeScreenRole.recommended : 'null';
    setState(() => isLoading = true);

    final jobStatus = await FDatabase.addJobToDb(
      requirements: requirements,
      companyLogo: selectedIndex == null ? '' : brandLogo[selectedIndex as int],
      companyName: companyName.text.trim(),
      location: location.text.trim(),
      salaryPerHour: salaryPerHour.text.trim(),
      title: title.text.trim(),
      jobType: jobType.text.trim(),
      homeScreenRole: role,
    );
    showCustomNotification(context, jobStatus.message);

    if (jobStatus.isSuccess) {
      title.clear();
      companyName.clear();
      location.clear();
      salaryPerHour.clear();
      jobType.clear();
      // companyLogo.clear();
    }

    setState(() => isLoading = false);
  }

  void _showCriteriaModal() {
    final criteria = TextEditingController();
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleAndtextForm(title: 'Requirement', controller: criteria),
                  const SizedBox(height: 30),
                  customButton(
                    context,
                    onTap: () {
                      requirements.add(criteria.text.trim());
                      criteria.clear();
                      setState(() {});
                      Navigator.pop(ctx);
                    },
                    text: 'Add Requirement',
                    bgColor: AppColor.primaryColor,
                    textColor: AppColor.white,
                  )
                ],
              ),
            ),
          );
        });
  }
}

class TitleAndtextForm extends StatelessWidget {
  const TitleAndtextForm({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller,
          hint: 'Enter Job Title',
          password: false,
        ),
      ],
    );
  }
}
