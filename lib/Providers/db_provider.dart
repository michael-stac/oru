import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gigi/Models/user_model.dart';
import 'package:gigi/Services/db_service.dart';
import 'package:gigi/Utils/db_constants.dart';

class DbProvider with ChangeNotifier {
  AppUser? _currentUser;

  Future setCurrentUser() async {
    final user = await FDatabase.getCurrentUser()
        as DocumentSnapshot<Map<String, dynamic>>;
    _currentUser = AppUser(
      name: user.get(DbConstants.name),
      email: user.get(DbConstants.email),
      id: user.get(DbConstants.id),
      imgUrl: user.get(DbConstants.imgUrl),
      isAuthenticated: user.get(DbConstants.isAuthenticated),
      profile: UserProfile(
        accountType: user.get(DbConstants.profile)[DbConstants.accountType],
        address: user.get(DbConstants.profile)[DbConstants.address],
        city: user.get(DbConstants.profile)[DbConstants.city],
        gender: user.get(DbConstants.profile)[DbConstants.gender],
        ocupationStatus:
            user.get(DbConstants.profile)[DbConstants.occupationStatus],
        businessName: user.get(DbConstants.profile)[DbConstants.businessName],
        businessSector:
            user.get(DbConstants.profile)[DbConstants.businessSector],
      ),
      mainProfile: UserMainProfile(
        about: user.get(DbConstants.mainProfile)[DbConstants.about],
        imgUrl: user.get(DbConstants.mainProfile)[DbConstants.profilePic],
      ),
    );
    notifyListeners();

    log(_currentUser.toString());
  }

  AppUser get currentUser => _currentUser as AppUser;
}
