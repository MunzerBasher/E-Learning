import 'package:e_learning/presentations/bloc/quiz/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCompleteScreen extends StatelessWidget {
  const QuizCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'سند',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
          ),
        ),
        body: BlocBuilder<QuizBloc, QuizLoadedState>(
          builder: (context, state) {
            var raing = ((context.read<QuizBloc>().correctAnswers /context.read<QuizBloc>().questions.length)* 100).toString().substring(0,2);
            if (state is QuizLoadingState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      const Text(
                        ' اكتمل الاختبار',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.height / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color(0xFFE25B5B),
                                      Color(0xFF4EEAD9)
                                    ], // الألوان المتدرجة للدائرة
                                    begin: Alignment
                                        .bottomRight, // Adjusted for RTL visual flow
                                    end: Alignment
                                        .topLeft, // Adjusted for RTL visual flow
                                  ).createShader(bounds);
                                },
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                      begin: 0.0,
                                      end: 0.85), // 85% كقيمة نهائية
                                  duration: const Duration(seconds: 1),
                                  builder: (context, value, child) {
                                    return CircularProgressIndicator(
                                      value: value,
                                      strokeWidth: 15,
                                      backgroundColor: Colors
                                          .grey.shade200, // لون خلفية الدائرة
                                      valueColor: const AlwaysStoppedAnimation<
                                              Color>(
                                          Colors
                                              .white), // اللون الذي سيتم تطبيق الـ Shader عليه
                                    );
                                  },
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${raing}%',
                                    style: const  TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const Text(
                                    'نجاح',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0E4429),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '${context.read<QuizBloc>().correctAnswers} من${context.read<QuizBloc>().questions.length}إجابة صحيحة',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      const Text(
                        'عمل رائع! أنت مستعد للتحدي\nالتالي.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF23194B),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'مراجعة الإجابات', // Translated: 'Review Answers'
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
