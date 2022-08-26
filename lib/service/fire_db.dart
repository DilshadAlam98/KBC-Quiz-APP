import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/service/helper_function.dart';

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

      /// saving deatils to preferences after fetching from firebase
      // Helper.saveLevel("1");
      // Helper.saveRank("45");
      // Helper.saveMoney("5000");

      /// checking if data is null  in firebase then data will seet else the data will fetch from existing user
      print("DATA VALUE---${value.data()}");
      if (value.data() == null) {
        await FirebaseFirestore.instance
            .collection("user")
            .doc(current_user.uid)
            .set({
          "uid":uid,
          "name": name,
          "email": email,
          "photoUrl": photoUrl,
          "amount": '5000',
          "level": "1",
          "rank": "1"
        }).then((value) {
          print("USER REGISTERED SUCCESSFULL ");
        });

        /// saving deatils to preferences when new  user is creating in firebase
        // Helper.saveLevel("1");
        // Helper.saveRank("45");
        // Helper.saveMoney("5000");
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
