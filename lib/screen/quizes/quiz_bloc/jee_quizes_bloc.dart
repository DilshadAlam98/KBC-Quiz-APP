import 'package:quiz_app/screen/quizes/model/jee_quiz_model.dart';
import 'package:quiz_app/screen/quizes/response/jee_quizes_repo.dart';
import 'package:rxdart/rxdart.dart';

class QuizListingBloc {
  final BehaviorSubject<List<QuizListingModel>?> _quizList =
      BehaviorSubject<List<QuizListingModel>>();

  Stream<List<QuizListingModel>?> get quizListingModel => _quizList;

  QuizListingRepo quizesListingRepo = QuizListingRepo();

  Future<void> fetchQuizListData() async {
    _quizList.add(await quizesListingRepo.fetchQuizListData());
  }
}
