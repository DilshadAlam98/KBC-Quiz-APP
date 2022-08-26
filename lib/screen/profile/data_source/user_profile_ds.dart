import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/screen/profile/model/model.dart';
import 'package:quiz_app/service/helper_function.dart';

class UserDataProfile {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Helper localDb = Helper();

  Future<UserModel?> fetchUserData() async {
    UserModel? userModel;
    CollectionReference reference =
        FirebaseFirestore.instance.collection('user');
    try {
      var userData = await reference.doc(auth.currentUser!.uid).get();
      userModel = UserModel.fromJson(userData);

      /// Saving credential  in shared preferences
      Helper.saveProfileUrl(userData['photoUrl']);
      Helper.saveName(userData['name']);
      Helper.saveMoney(userData['amount']);
      Helper.saveEmail(userData['email']);
      Helper.saveUserID(userData['uid']);
      Helper.saveRank(userData['rank']);
      Helper.saveLevel(userData['level']);
      return userModel;
    } catch (e) {
      print("///// ERROR.........$e");
    }
    // print("////////$userModel");
    return userModel;
  }
}
