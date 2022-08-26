import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/service/helper_function.dart';

class CheckQuizUnlock{
 Future<bool?>checkQuizUnlcokStatus(String quizId)async{
  String user_id='';
  bool unlocked=false;

  await Helper.getUserID().then((value) {
    user_id=value!;
  });
  await FirebaseFirestore.instance.collection('user').doc(user_id).collection("unlock_quiz").doc(quizId).get().then((value){
    unlocked=value.data().toString()!="null";
  });
  return unlocked;
}

}