import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gigi/Helpers/fire_b_helpers.dart';
import 'package:gigi/Models/user_model.dart';
import 'package:gigi/Services/db_service.dart';
import 'package:gigi/Utils/strings.dart';

class FAuth {
  static final _auth = FirebaseAuth.instance;

  static Future<FAuthResponse> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      log(credential.toString());
      if (credential.user == null) {
        return FAuthResponse(message: 'User is null');
      }
      final user = AppUser(name: name, email: email, id: credential.user!.uid);
      final dbStatus = await FDatabase.addUserToDb(user);
      if (!dbStatus.isSuccess) {
        return FAuthResponse(
            message: 'Failed to add user to database', content: dbStatus);
      }
      return FAuthResponse(
          message: 'Sign up success',
          isSuccess: true,
          content: credential.user!.uid);
    } on FirebaseAuthException catch (authE) {
      return FAuthResponse(message: authE.toString());
    } catch (e) {
      return FAuthResponse(message: e.toString());
    }
  }

  static void logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {}
}
