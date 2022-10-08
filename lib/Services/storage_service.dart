import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FStorage {
  static final _fStorage = FirebaseStorage.instance;

  static Future<String> uploadImage(String userId, File imageFile) async {
    String url = '';
    final ref = _fStorage.ref('ProfilePhoto').child(userId);
    await ref.putFile(imageFile).whenComplete(() async {
      log(url);
      url = await ref.getDownloadURL();
    }).catchError((e) {
      log('Image $e');
      url = 'null';
    });

    return url;
  }
}
