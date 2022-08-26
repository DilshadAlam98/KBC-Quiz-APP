import 'package:quiz_app/check_quiz_unlock/response/check_quiz_unlock_repo.dart';
import 'package:rxdart/rxdart.dart';

class CheckQuizUnlockBloc {
  final BehaviorSubject<bool?> QuizUnlocked = BehaviorSubject<bool>();

  Stream<bool?> get isQuizUnlocked => QuizUnlocked;

  CheckQuizUnlockRepo checkQuizUnlockRepo = CheckQuizUnlockRepo();

  Future<bool?> checkQuizUnlocked(String quizId) async {
    QuizUnlocked.add(await checkQuizUnlockRepo.checkQuizUnlock(quizId));
  }
}
