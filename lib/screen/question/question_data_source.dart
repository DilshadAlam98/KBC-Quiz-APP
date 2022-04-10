import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/screen/question/question_model.dart';

class QuestionDataSource {
  final random = Random();

  Future<QuestionsModel?> fetchQuestionModel({String? quizId, int? queMoney}) async {
    QuestionsModel questionsModel;
    CollectionReference reference =
        FirebaseFirestore.instance.collection("quizes");
    try {
      reference
          .doc(quizId)
          .collection("questions")
          .where("prize", isEqualTo: "$queMoney")
          .get()
          .then((value) {
        Map questionData = value.docs.elementAt(random.nextInt(1)).data();

        questionsModel=QuestionsModel.fromJson(questionData);
        print(questionData.length);
        print(questionsModel);
        print(questionData.values);
        return questionsModel;
      });
    } catch (e) {
      print("///////////////");
      print("///////////////");
      print("///////////////");
      print("///////////////");
      print("ERROR IN FETCHING DATA------$e");
    }
  }
}
