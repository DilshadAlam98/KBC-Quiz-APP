import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/screen/ui/life_line.dart';
import 'package:slider_side_menu/slider_side_menu.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Rs. 20000"),
          centerTitle: true,
        ),
        drawer:LifeLineDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.teal
          ),
          onPressed: () {

          },
          child: Text("Quit Game"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children:  [

                  Center(
                      child: Text(
                    "46",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
                  CircularProgressIndicator(
                    strokeWidth: 12,
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Which of the Following FrameWork Supports Dart Language ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            question_option("A. C++", Colors.red),
            question_option("B. Flutter", Colors.green),
            question_option("C. Angular", Colors.yellow),
            question_option("D. Java", Colors.white.withOpacity(0.7)),
            // SliderSideMenu(
            //     childrenData: [
            //       MenuItem(
            //           Icon(Icons.people,color: Colors.white,),
            //           Text("Auidence\nPole",style: const TextStyle(color: Colors.white,),)
            //       ),
            //       MenuItem(
            //           Icon(Icons.people,color: Colors.white,),
            //           Text("Flip\nQuestion",style: TextStyle(color: Colors.white,),)
            //       ),
            //       MenuItem(
            //           Icon(Icons.people,color: Colors.white,),
            //           Text("50\n50",style: TextStyle(color: Colors.white,),)
            //       ),
            //       MenuItem(
            //           Icon(Icons.people,color: Colors.white,),
            //           Text("Ask\nExpert",style: TextStyle(color: Colors.white,),)
            //       ),
            //
            //     ],
            //     description: "KBC LIFELINE"),
          ],
        ),
      ),
    );
  }

  Container question_option(String text, Color color) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: hieght / 20,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10, left: 30, right: 20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(35)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
