import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/screen/question/question_model.dart';
import 'package:quiz_app/screen/question/question_response.dart';
import 'package:quiz_app/screen/question/state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionRepo questionRepo;

  QuestionCubit(this.questionRepo) : super(QuestionStateLoading());

  void getQuestion({required String quizId, required int queMoney}) async {
    // if (state is QuestionStateLoading) return;
    // emit(QuestionStateLoading());
    try {
      QuestionsModel? questionsModel =
          await questionRepo.fetchQuestions(queMoney: queMoney, quizId: quizId);
      if (questionsModel != null) {
        emit(QuestionStateCompleted(questionsModel: questionsModel));
      } else {
        emit(QuestionStateFailed( message: "Failed to fetch"));
      }
    } catch (e) {
      emit(QuestionStateError(message: "Something went wrong"));
    }
  }
}
