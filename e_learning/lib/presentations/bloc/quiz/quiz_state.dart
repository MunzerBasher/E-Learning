part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizLoadingState extends QuizLoadedState {
  QuizLoadingState(
      {
        super.correctAnswers, 
        required super.questions,
        required super.currentIndex,
        required super.selectedAnswers,
        required super.isAnswered});

  @override
  List<Object?> get props => [];
}

class QuizLoadedState extends QuizState {
  final List<Question> questions;
  final int currentIndex;
  final Map<int, int> selectedAnswers;
  final bool isAnswered;
  final int? correctAnswers;

  @override
  List<Object?> get props =>
      [questions, currentIndex, selectedAnswers, isAnswered];

  QuizLoadedState({
    this.correctAnswers,
    required this.questions,
    required this.currentIndex,
    required this.selectedAnswers,
    required this.isAnswered,
  });

  Question get currentQuestion => questions[currentIndex];

  QuizLoadedState copyWith({
    List<Question>? questions,
    int? currentIndex,
    Map<int, int>? selectedAnswers,
    bool? isAnswered,
    int ? correctAnswers,
  }) {
    return QuizLoadedState(
      correctAnswers : this.correctAnswers,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isAnswered: isAnswered ?? this.isAnswered,
      
    );
  }
}

class ShowResultState extends QuizState {
  final int questionsNumber;
  final int correctAnswersNumber;

  ShowResultState(
      {required this.questionsNumber, required this.correctAnswersNumber});
}
