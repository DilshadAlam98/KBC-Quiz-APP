import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/check_quiz_unlock/bloc.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/screen/quizes/model/jee_quiz_model.dart';
import 'package:quiz_app/service/quiz_quiz_question_creator.dart';
import 'package:quiz_app/utils/quiz_unlock.dart';

import '../home/home.dart';

class QuizIntroPage extends StatefulWidget {
  QuizListingModel? quizListingModel;

  QuizIntroPage({required this.quizListingModel});

  @override
  State<QuizIntroPage> createState() => _QuizIntroPageState();
}

class _QuizIntroPageState extends State<QuizIntroPage> {
  CheckQuizUnlockBloc checkQuizUnlockBloc = CheckQuizUnlockBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkQuizUnlockBloc
        .checkQuizUnlocked(widget.quizListingModel?.quiz_id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: StreamBuilder(
          stream: checkQuizUnlockBloc.isQuizUnlocked,
          builder: (context, snapshot) {
            var isUnlocked = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: AppThemeConfig.buttonColor),
              child: Text(
                isUnlocked == true ? "Start Quiz" : "Unlock Quiz",
                style: AppThemeConfig.title,
              ),
              onPressed: ()async {
                var unlock_quiz =
                    int.parse(widget.quizListingModel?.unlock_amt_quiz ?? "");
                isUnlocked == true
                    ?
                await QuizQuestionCreatpr.genQuizQuestion(widget.quizListingModel?.quiz_id??"", 2000)
                    : UnlockQuiz.buyQuiz(
                            quizPrize: unlock_quiz,
                            quizId: widget.quizListingModel?.quiz_id ?? "")
                        .then((value) {
                        if (value == true) {
                          checkQuizUnlockBloc.QuizUnlocked.add(value);
                        } else {
                          Fluttertoast.showToast(msg: "InSufficient Amount");
                        }
                      });
              },
            );
          }),
      appBar: AppBar(
        backgroundColor: AppThemeConfig.appBarColor,
      ),
      // drawer: SideNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.quizListingModel?.quiz_name ?? ""}",
                      textAlign: TextAlign.center,
                      style: AppThemeConfig.mainTitle,
                    )
                  ],
                ),
              ),
              Image.network(
                widget.quizListingModel?.quiz_thumbnail ?? "",
                fit: BoxFit.fitWidth,
                height: SizeConfig.defaultSize! * 27,
                width: SizeConfig.screenWidth,
              ),
              introPage(widget.quizListingModel!),
            ],
          ),
        ),
      ),
    );
  }

  Widget introPage(QuizListingModel quizListingModel) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.topic_outlined,
                color: AppThemeConfig.iconColor,
              ),
              SizedBox(
                width: SizeConfig.defaultSize! * 1,
              ),
              Text(
                "Related to:",
                style: AppThemeConfig.mainTitle,
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3.7),
            child: Text(
              quizListingModel.topic ?? "",
              style: AppThemeConfig.title2,
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 1,
          ),
          Row(
            children: [
              Icon(
                Icons.topic_outlined,
                color: AppThemeConfig.iconColor,
              ),
              SizedBox(
                width: SizeConfig.defaultSize! * 1,
              ),
              Text(
                "About:",
                style: AppThemeConfig.mainTitle,
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3.7),
            child: Text(
              quizListingModel.about_quiz ?? "",
              style: AppThemeConfig.title2,
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          Row(
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: AppThemeConfig.iconColor,
              ),
              const SizedBox(
                width: 6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * .75),
                child: Text(
                    "Duration:" +
                        " " +
                        "${quizListingModel.duration ?? ""}" +
                        " Sec.",
                    style: AppThemeConfig.title),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
