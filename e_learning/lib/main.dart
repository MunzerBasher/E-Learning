import 'package:e_learning/applications/services/getit.dart';
import 'package:e_learning/data/quizrepo.dart';
import 'package:e_learning/presentations/bloc/Welcome/welcome_bloc.dart';
import 'package:e_learning/presentations/views/screens/welcome.dart';
import 'package:e_learning/presentations/bloc/quiz/quiz_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetItServices.setupLocator();
  runApp(const SanadApp());
}

class SanadApp extends StatelessWidget {
  const SanadApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GetIt getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(create: (_) => QuizBloc(getIt<Quizrepo>()))
      ],
      child: MaterialApp(
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        home: const WelcomeScreen(),
        //home: Spicaliztion(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
