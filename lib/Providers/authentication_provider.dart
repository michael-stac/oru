import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _resMessage = "";

  ///Field Getters
  bool get isLoading => _isLoading;

  String get resMessage => _resMessage;

  ///Sign In with google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///Face book auth

// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }

  ///Create user account with email and password
  void createNewAccount(BuildContext context,
      {String? email, String? name, String? password}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      credential.user!.updateDisplayName(name);

      _isLoading = false;
      _resMessage = 'Account Created';

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _isLoading = false;
        _resMessage = 'The password provided is too weak.';
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        _isLoading = false;
        _resMessage = 'The account already exists for that email.';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available';
      notifyListeners();
    } catch (_) {
      _isLoading = false;
      _resMessage = 'Please try again.';
      notifyListeners();
    }
  }

  ///Create user account profile and account type

  void createProfile(BuildContext context,
      {String? occupationStatus,
      String? gender,
      String? businessName,
      String? address,
      String? city,
      String? stateProvince,
      String? country,
      String? weekDay,
      String? timeOfDay}) {
    _isLoading = true;
    notifyListeners();

    // try{
    //   //fetch
    //
    // }


  }

  ///Create Sign In
  void signInUser(BuildContext context,
      {String? email, String? password}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      _isLoading = false;
      _resMessage = 'Signed In';
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _isLoading = false;
        _resMessage = 'No user found for that email.';
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        _isLoading = false;
        _resMessage = 'Wrong password provided for that user.';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available';
      notifyListeners();
    } catch (_) {
      _isLoading = false;
      _resMessage = 'Please try again.';
      notifyListeners();
    }
  }

  Future signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  void clearMessage() {
    _resMessage = '';
    notifyListeners();
  }
}
