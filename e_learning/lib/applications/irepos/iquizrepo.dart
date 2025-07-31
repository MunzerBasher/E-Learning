import 'package:e_learning/domain/entities/question.dart';

abstract class IQuizrepo {
  Future<List<Question>> getAllAsync(QuizConfiguration quiz);
}

class QuizConfiguration {
  final String topic;
  final int numberOfQuestions;
  final String difficultyLevel;

  QuizConfiguration({
    required this.topic,
    required this.numberOfQuestions,
    required this.difficultyLevel,
  });

  String get top => topic;
  String get difficulty => difficultyLevel;
  int get questions => numberOfQuestions;
}
