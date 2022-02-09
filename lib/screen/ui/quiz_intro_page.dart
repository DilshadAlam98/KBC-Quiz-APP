import 'package:flutter/material.dart';
import 'package:quiz_app/utils/side_nav_bar.dart';

import 'home.dart';

class QuizIntroPage extends StatelessWidget {
  const QuizIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text("Start Quiz"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
        },
      ),
      appBar: AppBar(),
      drawer: SideNavBar(),
      body: Container(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Quiz Name",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Image.network(
              "https://images.unsplash.com/photo-1644072980122-22f4365d4519?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1100&q=60",
              fit: BoxFit.cover,
              height: 230,
              width: MediaQuery.of(context).size.width,
            ),
            introPage(
                headline: "Related to",
                quizOption: "Science Astronomy Cricket, Isro"),
            introPage(headline: "Duration", quizOption: "10 min"),
            introPage(
                headline: "About Quiz",
                quizOption: "A quiz is a form of game or mind sport in which players attempt to answer questions correctly about a certain or variety of subjects. Quizzes can be used as a brief assessment in education and similar fields to measure growth in knowledge, abilities, or skills."),
          ],
        ),
      ),
    );
  }

  Widget introPage({required String headline, required String quizOption}) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.topic_outlined),
              SizedBox(
                width: 6,
              ),
              Text(
                headline,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              quizOption,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
