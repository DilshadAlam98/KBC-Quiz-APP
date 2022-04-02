import 'package:cloud_firestore/cloud_firestore.dart';

class QuizListingModel {
  String? about_quiz;
  Timestamp? created_date;
  String? duration;
  String? quiz_thumbnail;
  String? quiz_name;
  String? topic;
  String? quiz_id;
  String? unlock_amt_quiz;

  QuizListingModel(
      {this.about_quiz,
      this.created_date,
      this.duration,
      this.quiz_name,
      this.quiz_thumbnail,
      this.topic,
      this.quiz_id,this.unlock_amt_quiz});
}
