import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class FireDb {
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? current_user = auth.currentUser;
/// fetching data from firebase firestore
    await FirebaseFirestore.instance
        .collection("user")
        .doc(current_user!.uid)
        .get()
        .then((value) async {
      print("User already exist");
      print(current_user.uid);
      /// checking if data is null  in firebase then data will seet else the data will fetch from existing user
      print("DATA VALUE---${value.data()}");
      if (value.data() == null) {
        await FirebaseFirestore.instance
            .collection("user")
            .doc(current_user.uid)
            .set({
          "name": name,
          "email": email,
          "photoUrl": photoUrl,
          "amount": '4000'
        }).then((value) {
          print("USER REGISTERED SUCCESSFULL ");
        });
      }
    }).onError((error, stackTrace) async {
      print("UserId not exist");
      print(error);
    });
  }

  // Future<bool> getUser() async {
  //   final User? current_user = auth.currentUser;
  //   String user = "";
  //   await FirebaseFirestore.instance
  //       .collection("user")
  //       .doc(current_user!.uid)
  //       .get()
  //       .then((value) {
  //     user = value.data().toString();
  //   });
  //   if (user.toString() == null) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
