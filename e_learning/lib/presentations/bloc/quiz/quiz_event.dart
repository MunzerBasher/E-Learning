part of 'quiz_bloc.dart';

abstract class QuizEvent {}


class LoadQuestions extends QuizEvent {
  final Subject subject;
  LoadQuestions(this.subject);
}


class SelectAnswer extends QuizEvent {
  final int selectedIndex;
  SelectAnswer(this.selectedIndex);
}

class ShowResult extends QuizEvent{}

class GoToNextQuestion extends QuizEvent {}

class GoToPreviousQuestion extends QuizEvent {}
