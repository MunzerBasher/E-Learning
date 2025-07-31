import 'package:e_learning/presentations/bloc/quiz/quiz_bloc.dart';
import 'package:e_learning/presentations/views/screens/quiz.dart';
import 'package:e_learning/domain/classes/subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        child: ListView(
          children: [
            const Text(
              "اختار المادة",
              style: TextStyle(fontSize: 25),
            ),
            if (id == 1)
              ...List.generate(
                SubjectsList.subjects.length,
                (index) => InkWell(
                  onTap: () => {
                    context
                        .read<QuizBloc>()
                        .add(LoadQuestions(SubjectsList.subjects[index])),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => QuizScreen()))
                  },
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height / 150),
                    child: Card(
                      child: Container(
                        height: MediaQuery.of(context).size.height/10,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 50),
                        child: Center(child: Text(SubjectsList.subjects[index].name)),
                      ),
                    ),
                  ),
                ),
              )
            else
              ...List.generate(
                SubjectsList.artSubjects.length,
                (index) => InkWell(
                  onTap: () => {
                    context
                        .read<QuizBloc>()
                        .add(LoadQuestions(SubjectsList.artSubjects[index])),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => QuizScreen()))
                  },
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height / 150),
                    child: Card(
                      child: Container(
                        height: MediaQuery.of(context).size.height/10,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 50),
                        child: Center(child: Text(SubjectsList.artSubjects[index].name)),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      )),
    );
  }
}
