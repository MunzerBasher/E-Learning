import 'dart:convert';

import 'package:e_learning/applications/irepos/iquizrepo.dart';
import 'package:e_learning/domain/entities/question.dart';
import 'package:e_learning/data/dioserveces.dart';
import 'package:http/http.dart' as http;

class Quizrepo extends IQuizrepo {
  final ApiService api;

  Quizrepo({required this.api});

  @override
  Future<List<Question>> getAllAsync(QuizConfiguration quiz) async {
    List<Question> questions = [];
    try {
      // Construct the URL using parameters from the QuizConfiguration object
      var url = Uri.parse(
          'http://sanad-service.runasp.net/api/quiz/generate-ai?topic=${quiz.topic}&numberOfQuestions=${quiz.numberOfQuestions}&difficultyLevel=${quiz.difficultyLevel}');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        print('Response body: ${response.body}');
        if (decodedData is List) {
          for (var item in decodedData) {
            if (item is Map<String, dynamic>) {
              questions.add(Question.fromJson(item));
            } else {
              print(
                  'Warning: Expected a Map<String, dynamic> within the list, but got ${item.runtimeType}');
            }
          }
        } else {
          print(
              'Error: Expected a List from API, but got ${decodedData.runtimeType}');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception(
            'Failed to load questions from API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during HTTP request: $e');
      rethrow;
    }
    return questions;
  }
}
