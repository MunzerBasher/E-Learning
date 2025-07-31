import 'package:e_learning/domain/entities/notebooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'notebooks_event.dart';
part 'notebooks_state.dart';

class NotebooksBloc extends Bloc<NotebooksEvent, NotebooksState> {
  NotebooksBloc() : super(NotebooksInitial()) {
    on<NotebooksLoadingEvent>(_notebooksLoadingEvent);
  }
  List<Notebooks> notebooks = [
    Notebooks(course: 'الفيزياء', name: 'بواسطة منى إبراهيم'),
    Notebooks(
      course: 'التاريخ',
      name: 'بواسطة كريم صلاح',
    ),
     Notebooks(course: 'الفيزياء', name: 'بواسطة منى إبراهيم'),
    Notebooks(
      course: 'التاريخ',
      name: 'بواسطة كريم صلاح',
    ),
     Notebooks(course: 'الفيزياء', name: 'بواسطة منى إبراهيم'),
    Notebooks(
      course: 'التاريخ',
      name: 'بواسطة كريم صلاح',
    ),
  ];

  _notebooksLoadingEvent(NotebooksLoadingEvent e, Emitter em) async {
    em(NotebooksLoading());
    await Future.delayed(const Duration(seconds: 3));

    em(NotebooksLoaded(notebooks));
  }



}