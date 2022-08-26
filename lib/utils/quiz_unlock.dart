import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/service/helper_function.dart';

class UnlockQuiz {
  static Future<bool?> buyQuiz(
      {required int quizPrize, required String quizId}) async {
    String userId = '';
    await Helper.getUserID().then((value) {
      userId = value!;
    });
    bool isAmount = false;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .get()
        .then((user) {
      isAmount = quizPrize <= int.parse(user.data()!["amount"]);
    });

    if (isAmount) {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(userId)
          .collection("unlock_quiz")
          .doc(quizId)
          .set({"unlocked_at": DateTime.now()});
      print("/////////////");
      print("/////////////");
      print("////QUIZ IS UNLOCKED NOW");
      return true;
    } else {
      print("/////////");
      print("/////////");
      print("///////// Paisa nhi hai ///////");
      return false;
    }
  }
}
