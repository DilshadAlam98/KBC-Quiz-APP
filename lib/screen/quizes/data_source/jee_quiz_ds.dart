import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/screen/profile/model/model.dart';
import 'package:quiz_app/screen/quizes/model/jee_quiz_model.dart';
import 'package:quiz_app/service/helper_function.dart';

class QuizListingData {
  Future<List<QuizListingModel>?> fetchQuizListData() async {
    List<QuizListingModel>? quizListing = [];

    CollectionReference reference =
        FirebaseFirestore.instance.collection('quizes');

    try {
      var quizList = await reference.get();
      for (var jQ in quizList.docs) {
        quizListing.add(QuizListingModel.fromJson(jQ));
        print(quizList.docs);
        // Helper.saveQuizId(jQ.reference.id);
      }
    } catch (e) {
      print("//////////////////");
      print("//////////////////");
      print("////////////////// ERROR///////");
      print(e);
    }
    return quizListing;
  }
}
