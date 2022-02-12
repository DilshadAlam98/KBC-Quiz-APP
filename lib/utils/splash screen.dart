import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/ui/home.dart';
import 'package:quiz_app/screen/ui/login.dart';
import 'package:quiz_app/screen/ui/question.dart';
import 'package:quiz_app/service/local_db.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //Your animation controller
  late AnimationController _controller;
  late Animation<double> animation;

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
        color: Colors.white,
        child: Center(
            child: Hero(
          tag: "heroLogo",
          //FadeTransition makes your image Fade
          child: FadeTransition(
            //Use your animation here
            opacity: animation,
            child: CircleAvatar(
              //Here you load you image
              backgroundImage: const AssetImage("asset/img/kbc.png"),
              radius: MediaQuery.of(context).size.width * 0.25,
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
  }
}
