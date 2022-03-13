import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screen/ui/home.dart';
import 'package:quiz_app/screen/ui/login.dart';
import 'package:quiz_app/service/local_db.dart';
import 'helper_fuction.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();

FireDb fireDb = FireDb();
UserCredential? usercredential;

Future<User?> signinWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    usercredential = await auth.signInWithCredential(credential);
    final User? user = usercredential!.user;

    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);
    final User? currentUSer = await auth.currentUser;
    assert(currentUSer!.uid == user!.uid);
    print("USER=$user");
    print("/// SIGNUP UID---${currentUSer!.uid}");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
    fireDb.createNewUser(user!.displayName.toString(), user.email.toString(),
        user.photoURL.toString(), user.uid);
    Helper.saveUserID(user.uid);
    // Helper.saveName(currentUSer.displayName.toString());
    // Helper.saveProfileUrl(currentUSer.photoURL.toString());
  } catch (e) {
    Fluttertoast.showToast(msg: "Something went wrong");
    print("ERROR OCCURED IN SIGN IN $e");
  }
}

signOutUser(BuildContext context) async {
  await auth.signOut();
  await googleSignIn.signOut();
  print("SIGN OUT");
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ));

  Helper.deleteUser();

}
