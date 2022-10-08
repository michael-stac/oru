import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigi/Models/job_model.dart';
import 'package:gigi/Models/user_model.dart';
import 'package:gigi/Providers/db_provider.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:gigi/Services/db_service.dart';
import 'package:gigi/Utils/router.dart';
import 'package:provider/provider.dart';

import '../Authentication/CreateProfile/application_profile.dart';
import '../user_profile.dart';
import 'data.dart';
import 'job_detail.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  List<Color> colors = [
    const Color.fromARGB(255, 28, 107, 172),
    const Color.fromARGB(255, 12, 24, 19),
    const Color.fromARGB(255, 172, 129, 2),
    const Color.fromARGB(255, 172, 116, 34),
    const Color.fromRGBO(12, 63, 104, 1)
  ];
  int colorPos = 0;
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
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Welcome to Oru! ',
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
                            // Text(
                            //   user.name,
                            //   style: TextStyle(
                            //     fontSize: 17,
                            //     fontWeight: FontWeight.w500,
                            //     color: AppColor.black,
                            //   ),
                            // ),
                            const Text(
                              "Discover Jobs",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => nextPage(context, page: const Profile()),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 53,
                            width: 53,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                            child: user.mainProfile!.imgUrl == ''
                                ? null
                                : CachedNetworkImage(
                                    imageUrl: user.mainProfile!.imgUrl,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        )
                      ],
                    ),
                  )
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
                  ,
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
                    height: 200,
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
                                final l = colors.length;
                                log(((l / (pos + 1)) * l).toInt().toString());
                                return buildRecommendation(job, pos % l);
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
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.7))
            ]),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 5, left: 15, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   image: NetworkImage(job.companyLogo),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Image.asset(
                    job.companyLogo,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.jobType,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        job.companyName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 223, 223, 223),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.not_listed_location_sharp,
                  color: Color.fromARGB(255, 223, 223, 223),
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Text(job.title,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'N${job.salaryPerHour}/h',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 30),
                Flexible(
                  child: Text(
                    job.location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text(
            //       job.title,
            //       style: const TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 8,
            //     ),
            //     Text(
            //       r"N" + job.salaryPerHour + "/h",
            //       style: const TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 24,
            //       ),
            //     ),
            //   ],
            // )
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
          borderRadius: const BorderRadius.all(
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
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(job.companyLogo),
                //   fit: BoxFit.fitWidth,
                // ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // child: Image.asset(job.companyLogo, fit: BoxFit.fitWidth,),
              child: Image.asset(job.companyLogo),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.jobType,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    job.companyName,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )),
            Container(
              constraints: const BoxConstraints(maxWidth: 80),
              // color: Colors.red,
              child: Column(
                children: [
                  Text(
                    r"N" + job.salaryPerHour + "/h",
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    job.location,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
