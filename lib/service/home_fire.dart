// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class HomeFire {
//   static Future<List<Map<String,dynamic>>>getQuizes()async {
//     List<Map<String,dynamic>>all_quizes=[];
//   await FirebaseFirestore.instance.collection("quizes").get().then((querySnapshot) {
//       querySnapshot.docs.forEach((quiz) {
//
//         Map<String, dynamic>myQuiz=quiz.data();
//
//         myQuiz["Quizid"]=quiz.reference.id;
//         print("///////////////////");
//         print("///////////////////");
//         print(quiz.data());
//         all_quizes.add(myQuiz);
//         // quiz.data();
//       });
//     });
//     return all_quizes;
//   }
// }

/// This file will be deleted later