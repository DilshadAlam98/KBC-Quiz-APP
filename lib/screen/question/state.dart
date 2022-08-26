import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/question/question_model.dart';
@immutable
abstract class QuestionState extends Equatable {}

class QuestionStateLoading extends QuestionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QuestionStateFailed extends QuestionState {
  final String?message;
  QuestionStateFailed({this.message});
  @override
  List<Object> get props => [message!];
}

class QuestionStateCompleted extends QuestionState {
  final QuestionsModel? questionsModel;

  QuestionStateCompleted({this.questionsModel});

  @override
  // TODO: implement props
  List<Object?> get props => [questionsModel];
}

class QuestionStateError extends QuestionState {
  final String? message;

  QuestionStateError({this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
