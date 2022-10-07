import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gigi/Helpers/fire_b_helpers.dart';
import 'package:gigi/Models/user_model.dart';
import 'package:gigi/Utils/db_constants.dart';

class FDatabase {
  static final _db = FirebaseFirestore.instance;
  static final _userCollection = _db.collection(DbConstants.userPath);

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
}
