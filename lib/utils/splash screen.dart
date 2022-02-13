import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/ui/home.dart';
import 'package:quiz_app/screen/ui/login.dart';
import 'package:quiz_app/screen/ui/question.dart';
import 'package:quiz_app/service/local_db.dart';
import 'package:quiz_app/utils/permission_handeler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> animation;

  PermissionHandler permissionHandler=PermissionHandler();

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    //Implement animation here
    animation = Tween(
      begin: 0.3,
      end: 2.0,
    ).animate(_controller);
    super.initState();
    // Timer(const Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (BuildContext context) =>
    //           FirebaseAuth.instance.currentUser != null
    //               ? const Home()
    //               : const Login()));
    // });
    chekUser();
    permissionHandler.requestCameraPermission();
    permissionHandler.requestStorafePermission();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QuestionPage(),
        ));
        // Navigator.pushNamed(context, MyHomePage.id);
      },
      child: Container(
        color: Colors.amberAccent,
        child: Center(
            child: Hero(
          tag: "heroLogo",
          //FadeTransition makes your image Fade
          child: FadeTransition(
            //Use your animation here
            opacity: animation,
            child: const CircleAvatar(
              //Here you load you image
              backgroundImage: AssetImage("asset/img/kbc.png",),
              radius: 170,
            ),
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void chekUser() async {
    String? token;
    token = await LocalDb.getUserID();

    Future.delayed(Duration(seconds: 4), () {
      if (token != "" && token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
        print("user already signed in");
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ));
        print("user logged out");
      }
    });
  }
}
