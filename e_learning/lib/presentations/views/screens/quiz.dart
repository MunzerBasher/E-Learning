import 'package:e_learning/presentations/views/screens/quizcomplete.dart';
import 'package:e_learning/presentations/bloc/quiz/quiz_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuizBloc, QuizLoadedState>(
        builder: (context, state) {
          if (state is QuizLoadingState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Stack(
                  children: [
                    CircularProgressIndicator(),
                    Icon(Icons.smart_toy_rounded,color: Colors.green,),
                  ],
                ) ,
              ),
            );
          }
          final question = state.currentQuestion;
          final selectedIndex = state.selectedAnswers[question.id];
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 25,
                vertical: MediaQuery.of(context).size.height / 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                _buildProgressBar(
                    (state.selectedAnswers.length) / state.questions.length,
                    context),
                Text(
                    "السؤال ${state.currentIndex + 1}/${state.questions.length}"),
                SizedBox(height: MediaQuery.of(context).size.height / 45),
                Text(question.text, style: const TextStyle(fontSize: 20)),
                SizedBox(height: MediaQuery.of(context).size.height / 45),
                ...List.generate(question.options.length, (index) {
                  Color? color;
                  if (state.isAnswered) {
                    if (index == question.correctIndex) {
                      color = Colors.green;
                    } else if (index == selectedIndex) {
                      color = Colors.red;
                    } else {
                      color = Colors.grey.shade200;
                    }
                  } else {
                    color = Colors.grey.shade100;
                  }

                  return GestureDetector(
                    onTap: state.isAnswered
                        ? null
                        : () {
                            context.read<QuizBloc>().add(SelectAnswer(index));
                          },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 100),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 45),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Text(question.options[index]),
                    ),
                  );
                }),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: state.currentIndex > 0
                          ? () {
                              context
                                  .read<QuizBloc>()
                                  .add(GoToPreviousQuestion());
                            }
                          : null,
                      child: const Text("السابق"),
                    ),
                    state.currentIndex < state.questions.length - 1
                        ? ElevatedButton(
                            onPressed: () {
                              context.read<QuizBloc>().add(GoToNextQuestion());
                            },
                            child: const Text("التالي"),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const QuizCompleteScreen()));
                              context.read<QuizBloc>().add(ShowResult());
                            },
                            child: const Text("عرض النتائج"),
                          ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressBar(double percentage, BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: const Color(0xFFE2E0EE),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4A34AF)),
            minHeight: 15,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 25),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "${(100 * percentage).toString().substring(0, 2)}%",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
