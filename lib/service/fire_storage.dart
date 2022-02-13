import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FireStorage {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadLocalImage(File profileImage) async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref("upload/file")
          .putFile(profileImage);
    } catch (e) {
      print("STORAGE FIREBASE IMAGE $e");
    }
  }
}
