import 'package:quiz_app/check_quiz_unlock/data_source/check_quiz_unlock.dart';

class CheckQuizUnlockRepo{
  CheckQuizUnlock checkUnlock=CheckQuizUnlock();
  Future<bool?>checkQuizUnlock(String quizId)async{
    return checkUnlock.checkQuizUnlcokStatus(quizId);

  }
}