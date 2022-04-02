import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQuestionCreatpr{
  
static genQuizQuestion(String quizId, int queMoney)async{

  late Map questionData;
  await FirebaseFirestore.instance.collection('quizes').doc(quizId).collection("question").where("prize",isEqualTo:queMoney ).get().then((value){
    questionData=value.docs.elementAt(0).data();
  });
  print(questionData);
}
  
}