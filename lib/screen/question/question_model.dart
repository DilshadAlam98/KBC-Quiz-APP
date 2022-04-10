import 'dart:convert';

class QuestionsModel {
  String? question;
  String? askTheExpert;
  String? correctAnswer;
  String? optA;
  String? optB;
  String? optC;
  String? optD;
  String? prize;

  QuestionsModel(
      {required this.question,
      required this.askTheExpert,
      required this.correctAnswer,
      required this.optA,
      required this.optB,
      required this.optC,
      required this.optD,
      required this.prize});

  QuestionsModel.fromJson(Map<dynamic, dynamic> json) {
    question = json["question"];
    askTheExpert = json["ask_expert"];
    correctAnswer = json["correct_answer"];
    optA = json["opt_A"];
    optB = json["opt_B"];
    optC = json["opt_C"];
    optD = json["opt_D"];
    prize = json["prize"];
  }
}
