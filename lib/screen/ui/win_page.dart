import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class WinPage extends StatefulWidget {
  const WinPage({Key? key}) : super(key: key);

  @override
  _WinPageState createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {

  late ConfettiController confettiController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
      confettiController.play();
    });
  }
  void initController(){
    confettiController=ConfettiController(duration: Duration(seconds: 1));
  }
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
          onPressed: () {

          },child: Icon(Icons.share),
        ),
        backgroundColor: Colors.transparent.withOpacity(0.5),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "CONGRATULATIONS",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent),
                    ),
                    const Text("You Answer is correct",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    const Text("You Won",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Colors.lightGreenAccent)),
                    const Text("RS. 5,40,000",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset("asset/img/check.jpeg",fit: BoxFit.cover,)),
                    ElevatedButton(onPressed: () {

                    }, child: Text(("Next")))
                  ],
                ),
              ),
              buildConffetiWidget(confettiController, pi/2)
            ],
          ),
        ),
      ),
    );
  }
  Align buildConffetiWidget(controller,double blastDirection){
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(20,30),
        shouldLoop: false,
          confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.18,
        numberOfParticles: 8,
        gravity: 0.5,
      ),
    );
  }
}
