import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class LooserScreen extends StatefulWidget {
  const LooserScreen({Key? key}) : super(key: key);

  @override
  _LooserScreenState createState() => _LooserScreenState();
}

class _LooserScreenState extends State<LooserScreen> {
  late ConfettiController confettiController;

  @override
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: hieght,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "asset/img/background.png",
              ))),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.share),
        ),
        backgroundColor: Colors.transparent.withOpacity(0.5),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ops!!",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent),
                  ),
                  const Text("You Answer is Incorrect",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  const Text("You Loss",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.lightGreenAccent)),
                  // Icon(Icons.error,color: Colors.white,size: 40,),

                  // const Text("RS. 5,40,000",
                  //     style: TextStyle(
                  //         fontSize: 28,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.lightGreenAccent)),

                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text(("Try Again")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
