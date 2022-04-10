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
      this.quiz_id,
      this.unlock_amt_quiz});

  QuizListingModel.fromJson(DocumentSnapshot<Object?> doc) {
    about_quiz = doc['about_quiz'];
    created_date = doc['created_at'];
    duration = doc['duration'];
    quiz_name = doc['quiz_name'];
    quiz_thumbnail = doc['quiz_thumbnail'];
    unlock_amt_quiz = doc['unlock_amt_quiz'];
    quiz_id = doc.reference.id;
    topic = doc['topics'];
  }
}
