import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/screen/question/question_cubit.dart';
import 'package:quiz_app/screen/question/question_model.dart';
import 'package:quiz_app/screen/question/question_response.dart';
import 'package:quiz_app/screen/question/state.dart';
import 'package:quiz_app/screen/ui/life_line.dart';
import 'package:quiz_app/utils/alert_message.dart';
import 'package:slider_side_menu/slider_side_menu.dart';

class QuestionPage extends StatefulWidget {
  String? quizId;
  int? queMoney;

  QuestionPage({this.quizId, this.queMoney});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  @override
  Widget build(BuildContext context) {
    final questionRepo = QuestionRepo();
    return BlocProvider<QuestionCubit>(
      create: (context) => QuestionCubit(questionRepo)
        ..getQuestion(quizId: widget.quizId!, queMoney: widget.queMoney!),
      child: Scaffold(
        backgroundColor: AppThemeConfig.appBackGroundColour,
        appBar: AppBar(
          backgroundColor: AppThemeConfig.appBarColor,
          title: const Text("Rs. 20000"),
          centerTitle: true,
        ),
        drawer: LifeLineDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: AppThemeConfig.buttonColor),
          onPressed: () {},
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
                children: [
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

            BlocConsumer<QuestionCubit, QuestionState>(
              listener: (context, state) {},
              builder: (context, state) {
               if (state is QuestionStateCompleted) {
                  return Container(
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      state.questionsModel?.question ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                }
                return Container();
              },
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
