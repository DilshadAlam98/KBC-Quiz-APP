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
        quizListing.add(QuizListingModel(
            about_quiz: jQ['about_quiz'],
            created_date: jQ['created_at'],
            duration: jQ['duration'],
            quiz_name: jQ['quiz_name'],
            quiz_thumbnail: jQ['quiz_thumbnail'],
            unlock_amt_quiz: jQ['unlock_amt_quiz'],
            quiz_id: jQ.reference.id,
            topic: jQ['topics']));

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

  // List<QuizListingModel> quizListing = [];
  // fetchQuizListData() {
  //   Stream<QuerySnapshot> quizQuery = FirebaseFirestore.instance.collection(
  //       "quizes").snapshots();
  //   quizQuery.forEach((field) {
  //     field.docs.asMap().forEach((index, data) {
  //       quizListing.add(QuizListingModel(
  //           about_quiz: field.docs[index]['about_quiz'],
  //           created_date: field.docs[index]['created_at'],
  //           duration: field.docs[index]['duration'],
  //           quiz_name: field.docs[index]['quiz_name'],
  //           quiz_thumbnail: field.docs[index]['quiz_thumbnail'],
  //           quiz_id: field.docs[index].reference.id,
  //           topic: field.docs[index]['topics'])
  //       );
  //     });
  //   });
  //   return quizListing;
  // }


}
