import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/screen/ui/login.dart';
import 'package:quiz_app/screen/ui/quiz_intro_page.dart';
import 'package:quiz_app/service/local_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fire_db.dart';

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
          builder: (context) => QuizIntroPage(),
        ));
    fireDb.createNewUser(user!.displayName.toString(), user.email.toString(),
        user.photoURL.toString(), user.uid);
    LocalDb.saveUserID(user.uid);
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

  LocalDb.deleteUser();
}
