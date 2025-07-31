import 'package:e_learning/applications/irepos/iquizrepo.dart';
import 'package:e_learning/domain/entities/question.dart';
import 'package:e_learning/domain/entities/subject.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';



class QuizBloc extends Bloc<QuizEvent, QuizLoadedState> {
  final IQuizrepo quizrepo;
  List<Question> questions = [];
  int correctAnswers = 0;
  Set<int> selectedcorrectAnswers = {};
  bool isShow = false;  
  QuizBloc(this.quizrepo)
      : super(QuizLoadingState(
            questions: const [],
            currentIndex: 1,
            selectedAnswers: const {},
            correctAnswers: 0,
            isAnswered: false)) {
    on<LoadQuestions>((event, emit) async {
      print(event.subject.name);
      emit(QuizLoadingState(
          questions: const [],
          currentIndex: 1,
          selectedAnswers: const {},
          isAnswered: false,
          ));
      questions = await quizrepo.getAllAsync(QuizConfiguration(
          difficultyLevel: "4", numberOfQuestions: 10, topic: "1"));
      selectedcorrectAnswers.clear();
      isShow = false;
      correctAnswers = 0;
      emit(QuizLoadedState(
          questions: questions,
          currentIndex: 0,
          selectedAnswers: const {},
          isAnswered: false,
          ));
    });

    on<ShowResult>((event, emit) {
      //var correctAnswers = 0;
      for (int i = 0; i < questions.length; i++) {
        var selectedAnswer = state.selectedAnswers[questions[i].id];
        if (selectedAnswer == null) continue;
        if (!isShow && selectedAnswer == questions[i].correctIndex) {
          ++correctAnswers;
        }
      }
      isShow = true;
      print(correctAnswers);
      emit(state.copyWith(
          selectedAnswers: state.selectedAnswers,
          isAnswered: true,
          correctAnswers: correctAnswers));
    });

    on<SelectAnswer>((event, emit) {
      final question = state.currentQuestion;
      final selectedAnswers = Map<int, int>.from(state.selectedAnswers);
      selectedAnswers[question.id] = event.selectedIndex;
      emit(state.copyWith(
        selectedAnswers: selectedAnswers,
        isAnswered: true,
      ));
    });

    on<GoToNextQuestion>((event, emit) {
      if (state.currentIndex < state.questions.length - 1) {
        emit(state.copyWith(
          currentIndex: state.currentIndex + 1,
          isAnswered: state.selectedAnswers
              .containsKey(state.questions[state.currentIndex + 1].id),
        ));
      }
    });

    on<GoToPreviousQuestion>((event, emit) {
      if (state.currentIndex > 0) {
        emit(state.copyWith(
          currentIndex: state.currentIndex - 1,
          isAnswered: state.selectedAnswers
              .containsKey(state.questions[state.currentIndex - 1].id),
        ));
      }
    });
  }
}
