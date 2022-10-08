import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gigi/Helpers/fire_b_helpers.dart';
import 'package:gigi/Models/job_model.dart';
import 'package:gigi/Models/user_model.dart';
import 'package:gigi/Utils/db_constants.dart';
import 'package:gigi/Widgets/custom_notification.dart';

class FDatabase {
  static final _db = FirebaseFirestore.instance;
  static final _userCollection = _db.collection(DbConstants.userPath);
  static final _jobCollection = _db.collection(DbConstants.jobPath);

  static Future<FDbResponse> addUserToDb(AppUser user) async {
    try {
      await _userCollection.doc(user.id).set({
        DbConstants.email: user.email,
        DbConstants.id: user.id,
        DbConstants.imgUrl: user.imgUrl,
        DbConstants.name: user.name,
        DbConstants.isAuthenticated: user.isAuthenticated,
      });
      return FDbResponse(isSuccess: true);
    } catch (e) {
      return FDbResponse(message: e.toString());
    }
  }

  static Future<FDbResponse> isUserVerified(String userId) async {
    try {
      final user = await _userCollection.doc(userId).get();
      log('Authenticated === ${user.get(DbConstants.isAuthenticated).toString()}');
      return FDbResponse(isSuccess: user.get(DbConstants.isAuthenticated));
    } catch (e) {
      return FDbResponse(message: 'An Error Ocuured', content: false);
    }
  }

  static Future<FDbResponse> verifyUser(String userId) async {
    try {
      await _userCollection.doc(userId).update({
        DbConstants.isAuthenticated: true,
      });
      return FDbResponse(isSuccess: true);
    } catch (e) {
      return FDbResponse(message: e.toString());
    }
  }

  static Future<FDbResponse> createProfile(String userId) async {
    try {
      await _userCollection.doc(userId).update({
        DbConstants.isAuthenticated: true,
      });
      return FDbResponse(isSuccess: true);
    } catch (e) {
      return FDbResponse(message: e.toString());
    }
  }

  static Future<FDbResponse> addUserProfile(
      {required UserProfile profile, required String userId}) async {
    final isBusiness = profile.accountType == AccountType.business;
    try {
      await _userCollection.doc(userId).update({
        DbConstants.mainProfile: {
          DbConstants.about: '',
          DbConstants.resumes: [],
          DbConstants.experiences: [],
          DbConstants.role: '',
          DbConstants.profile: '',
          DbConstants.profilePic: '',
        },
        DbConstants.profile: {
          DbConstants.accountType: profile.accountType,
          DbConstants.occupationStatus: profile.ocupationStatus,
          DbConstants.gender: profile.gender,
          DbConstants.businessName: !isBusiness ? null : profile.businessName,
          DbConstants.businessSector:
              !isBusiness ? null : profile.businessSector,
          DbConstants.address: profile.address,
          DbConstants.city: profile.city,
          DbConstants.state: profile.state,
          DbConstants.country: profile.country,
        }
      });
      return FDbResponse(
          isSuccess: true, message: 'Profile added succesfullty');
    } catch (e) {
      log(e.toString());
      return FDbResponse(message: e.toString());
    }
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>?>
      getCurrentUser() async {
    try {
      final user = await _userCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<FDbResponse> addJobToDb({
    required String companyLogo,
    required String companyName,
    required String homeScreenRole,
    required String location,
    required String salaryPerHour,
    required String title,
    required String jobType,
    required List<String> requirements,
  }) async {
    try {
      await _jobCollection.add({
        DbConstants.jobCompanyLogo: companyLogo,
        DbConstants.jobCompanyName: companyName,
        DbConstants.jobHomeScreenRole: homeScreenRole,
        DbConstants.jobLocation: location,
        DbConstants.jobSalaryPerHour: salaryPerHour,
        DbConstants.jobTitle: title,
        DbConstants.jobType: jobType,
        DbConstants.jobRequirements: requirements,
      });
      return FDbResponse(isSuccess: true, message: 'Job Added successfully');
    } catch (e) {
      return FDbResponse(message: e.toString());
    }
  }

  static Future<List<JobModel>> fetchJobs({String? homeScreenRole}) async {
    QuerySnapshot<Map<String, dynamic>> product;
    List<JobModel> jobs = [];

    log('In fetc jobs');

    try {
      if (homeScreenRole == HomeScreenRole.recommended) {
        product = await _jobCollection
            .where(DbConstants.jobHomeScreenRole,
                isEqualTo: HomeScreenRole.recommended)
            .get();
      } else {
        product = await _jobCollection.get();
      }

      product.docs.forEach((el) {
        jobs.add(
          JobModel(
            id: el.id,
            requirements:
                List<String>.from(el.get(DbConstants.jobRequirements)),
            title: el.get(DbConstants.jobTitle),
            companyName: el.get(DbConstants.jobCompanyName),
            location: el.get(DbConstants.jobLocation),
            salaryPerHour: el.get(DbConstants.jobSalaryPerHour),
            jobType: el.get(DbConstants.jobType),
            companyLogo: el.get(DbConstants.jobCompanyLogo),
            homeScreenRole: el.get(DbConstants.jobHomeScreenRole),
          ),
        );
      });
      log(jobs.length.toString());
    } catch (e) {
      log(e.toString());
    }

    return jobs;
  }

  static Future addPofileS({
    required String id,
    required BuildContext context,
    required String key,
    required value,
  }) async {
    try {
      await _userCollection
          .doc(id)
          .update({'${DbConstants.mainProfile}.$key': value});
      showCustomNotification(context, 'Update Successfull');
    } catch (e) {
      showCustomNotification(context, 'Update Failled --- $e');
    }
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserSettings(
      String userId) {
    return _userCollection.doc(userId).snapshots();
  }
}
