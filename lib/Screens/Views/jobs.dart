import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigi/Models/job_model.dart';
import 'package:gigi/Providers/db_provider.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:gigi/Services/db_service.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'job_detail.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  List<Color> colors = [Colors.blue, Colors.red, Colors.amber];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DbProvider>(context).currentUser;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Welcome to Oru ',
                                    style: TextStyle(
                                        color: AppColor.gray.withOpacity(0.7),
                                        fontSize: 15),
                                    children: [
                                  TextSpan(
                                      text: '',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.primaryColor
                                              .withOpacity(1)))
                                ])),
                            Text(
                              "Discover Jobs",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2),
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                        )
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  //   child: Wrap(
                  //     crossAxisAlignment: WrapCrossAlignment.start,
                  //     spacing: 16,
                  //     runSpacing: 16,
                  //     children: [
                  //       buildFilterOption("Developer"),
                  //       buildFilterOption("San Francisco"),
                  //       buildFilterOption(r"$30 - 50h"),
                  //       buildFilterOption("Part-Time"),
                  //     ],
                  //   ),
                  // ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: Text(
                      "Recommended for you",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 190,
                    child: FutureBuilder<List<JobModel>>(
                        future: FDatabase.fetchJobs(
                            homeScreenRole: HomeScreenRole.recommended),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            log(snapshot.data.toString());
                            // return ListView(
                            //   physics: BouncingScrollPhysics(),
                            //   scrollDirection: Axis.horizontal,
                            //   children: buildRecommendations(snapshot.data),
                            // );

                            return ListView.builder(
                              itemBuilder: (_, pos) {
                                final job = snapshot.data![pos];
                                return buildRecommendation(job, pos);
                              },
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                            );
                          }
                          return CupertinoActivityIndicator(
                              color: AppColor.primaryColor, radius: 30);
                        }),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: Text(
                      "Recently added",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  FutureBuilder<List<JobModel>>(
                      future: FDatabase.fetchJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          log(snapshot.data.toString());
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: snapshot.data!
                                  .map((job) => buildLastJob(job))
                                  .toList(),
                            ),
                          );
                        }
                        return CupertinoActivityIndicator(
                            color: AppColor.primaryColor, radius: 30);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildFilterOption(String text){
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(5),
  //       ),
  //     ),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             text,
  //             style: TextStyle(
  //               fontSize: 14,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Icon(
  //             Icons.clear,
  //             size: 18,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // List<Widget> buildRecommendations(recomendedJobs) {
  //   List<Widget> list = [];
  //   list.add(SizedBox(
  //     width: 15,
  //   ));
  //   for (var i = 0; i < jobs.length; i++) {
  //     list.add(buildRecommendation(jobs[i]));
  //   }
  //   list.add(SizedBox(
  //     width: 15,
  //   ));
  //   return list;
  // }

  Widget buildRecommendation(JobModel job, int pos) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobDetail(job: job)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: colors[pos],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.6))
            ]),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 5, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.network(job.companyLogo),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: NetworkImage(job.companyLogo),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Text(
                      job.jobType,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    r"N" + job.salaryPerHour + "/h",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // List<Widget> buildLastJobs() {
  //   List<Widget> list = [];
  //   for (var i = jobs.length - 1; i > -1; i--) {
  //     list.add(buildLastJob(jobs[i]));
  //   }
  //   return list;
  // }

  Widget buildLastJob(JobModel job) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobDetail(job: job)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.15))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    job.companyName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )),
            Text(
              r"$" + job.salaryPerHour + "/h",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
