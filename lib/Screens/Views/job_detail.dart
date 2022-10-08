import 'package:flutter/material.dart';
import 'package:gigi/Models/job_model.dart';
import 'package:gigi/Screens/BottomNavPages/Applcations/job_application.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:gigi/Widgets/custom_button.dart';
import 'package:gigi/Widgets/custom_modal.dart';

import '../../Utils/router.dart';

class JobDetail extends StatelessWidget {
  final JobModel job;

  JobDetail({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          job.companyName,
          style: const TextStyle(
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
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(job.companyLogo),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  job.title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  job.location,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          job.jobType,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Center(
                      child: Text(
                        r"$" + job.salaryPerHour + "/h",
                        style: const TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Requirements",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 260,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: job.requirements
                          .map((e) => buildRequirement(e))
                          .toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Row(
              //   children: [
              //     const SizedBox(width: 16),
              //     Expanded(
              //       child: Container(
              //         height: 60,
              //         decoration: BoxDecoration(
              //           color: Colors.red[500],
              //           borderRadius: const BorderRadius.all(
              //             Radius.circular(10),
              //           ),
              //         ),
              //         child: const Center(
              //           child: Text(
              //             "Apply Now",
              //             style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),

              //   ],
              // ),
              customButton(
                context,
                onTap: () => _handleApply(context),
                text: 'Apply Now',
                bgColor: Colors.red[500],
                textColor: AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List<Widget> buildRequirements() {
  //   List<Widget> list = [];
  //   for (var i = 0; i < 100; i++) {
  //     list.add(buildRequirement(getJobsRequirements()[1]));
  //   }
  //   return list;
  // }

  Widget buildRequirement(String requirement) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              requirement,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleApply(BuildContext context) {
    Notifications.showCustomQueryDialogue(
        context: context,
        onCancelClicked: () {},
        onOkClicked: () => nextPage(context,
            page: JobApplication(
              job: job,
            )),
        message: 'Are you sure?',
        subMessage:
            'Are you sure you want to apply for the ${job.title} role at ${job.companyName}');
  }
}
