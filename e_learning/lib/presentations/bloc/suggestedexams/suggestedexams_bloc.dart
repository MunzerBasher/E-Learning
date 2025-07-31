import 'dart:ui';

import 'package:e_learning/domain/entities/suggexam.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'suggestedexams_event.dart';
part 'suggestedexams_state.dart';

class SuggestedexamsBloc
    extends Bloc<SuggestedexamsEvent, SuggestedexamsState> {
  SuggestedexamsBloc() : super(SuggestedexamsInitial()) {
    on<SuggestedexamsLoading>((event, emit) async {
      emit(SuggestedexamLoading());

      await Future.delayed(const Duration(seconds: 2));
      emit(SuggestedexamLoaded(list));
    });
  }

  List<ExamDetails> list = [
    ExamDetails(
      title: 'الاختبار النهائي',
      schedule: 'مجدول في 10 يونيو',
      cardBackgroundColor: const Color(0xFFF5F5F5),
    ),
    ExamDetails(
      title: 'الاختبار النهائي',
      schedule: 'مجدول في 10 يونيو',
      cardBackgroundColor: const Color(0xFFF5F5F5),
    ),
    ExamDetails(
      title: 'الاختبار النهائي',
      schedule: 'مجدول في 10 يونيو',
      cardBackgroundColor: const Color(0xFFF5F5F5),
    ),
    ExamDetails(
      title: 'الاختبار النهائي',
      schedule: 'مجدول في 10 يونيو',
      cardBackgroundColor: const Color(0xFFF5F5F5),
    ),
    ExamDetails(
      title: 'الاختبار النهائي',
      schedule: 'مجدول في 10 يونيو',
      cardBackgroundColor: const Color(0xFFF5F5F5),
    ),
    ExamDetails(
      title: 'الاختبار النهائي',
      schedule: 'مجدول في 10 يونيو',
      cardBackgroundColor: const Color(0xFFF5F5F5),
    ),
  ];
}
