import 'package:quiz_app/screen/quizes/data_source/jee_quiz_ds.dart';
import 'package:quiz_app/screen/quizes/model/jee_quiz_model.dart';

class QuizListingRepo{
  QuizListingData quizListingData=QuizListingData();

  Future<List<QuizListingModel>?>fetchQuizListData()async{
    final quizList=await quizListingData.fetchQuizListData();
    return quizList;
  }

}