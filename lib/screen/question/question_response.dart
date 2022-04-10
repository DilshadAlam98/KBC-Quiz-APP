import 'package:quiz_app/screen/question/question_data_source.dart';
import 'package:quiz_app/screen/question/question_model.dart';

class QuestionRepo {
  final QuestionDataSource questionDataSource = QuestionDataSource();

  Future<QuestionsModel?> fetchQuestions({String? quizId, int? queMoney})async{
    return await questionDataSource.fetchQuestionModel(queMoney: queMoney,quizId: quizId);
  }
}


