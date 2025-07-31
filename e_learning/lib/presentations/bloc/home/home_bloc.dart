import 'package:e_learning/domain/entities/mainscreenlive.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Profile> lives = [
    Profile(
      imagePath: 'assets/profile_ahmad.jpg',
      name: 'أحمد علي',
      major: 'الرياضيات',
      course: 'مراجعة الجبر',
    ),
    Profile(
      imagePath: 'assets/profile_ahmad.jpg',
      name: 'محمد أدم',
      major: "الأحياء",
      course: "مراجعة التكاثر",
    ),
    Profile(
      imagePath: 'assets/profile_ahmad.jpg',
      name: "عادل خالد",
      major: 'الرياضيات',
      course: 'مراجعة الجبر',
    ),
    
    Profile(
      imagePath: 'assets/profile_ahmad.jpg',
      name: "منذر بشير",
      major: "الحاسوب",
      course: "مراجعة خوازميات البحث",
    ),
  ];
  HomeBloc() : super(const HomeInitial()) {
    // Register event handlers
    on<TabChanged>(_onTabChanged);
    on<LiveNowJoinTapped>(_onLiveNowJoinTapped);
    on<ExamStartTapped>(_onExamStartTapped);
    on<NotebookStartTapped>(_onNotebookStartTapped);
    on<ViewAllNotebooksTapped>(_onViewAllNotebooksTapped);
    on<LoadData>((enevt, emit) async {
      emit(const HomeLivesLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(HomeLivesLoaded(lives: lives));
    });
  }

  void _onTabChanged(TabChanged event, Emitter<HomeState> emit) {
    debugPrint('Tab changed to index: ${event.newIndex}');

    emit(HomeLoaded(selectedIndex: event.newIndex));
  }

  Future<void> _onLiveNowJoinTapped(
      LiveNowJoinTapped event, Emitter<HomeState> emit) async {
    debugPrint('Join button tapped for Live Session: ${event.sessionName}');
    // In a real app, you would perform navigation here
    // emit(HomeNavigating('/live_session_details', data: event.sessionName));
    // For now, we'll just log and potentially show a success message
    // emit(HomeLoaded(selectedIndex: state.selectedIndex)); // Re-emit current state if no navigation
  }

  // Handles the ExamStartTapped event
  Future<void> _onExamStartTapped(
      ExamStartTapped event, Emitter<HomeState> emit) async {
    debugPrint('Start button tapped for Exam: ${event.examTitle}');
    // In a real app, you would perform navigation to the exam screen
    // emit(HomeNavigating('/exam_screen', data: event.examTitle));
    // emit(HomeLoaded(selectedIndex: state.selectedIndex));
  }

  // Handles the NotebookStartTapped event
  Future<void> _onNotebookStartTapped(
      NotebookStartTapped event, Emitter<HomeState> emit) async {
    debugPrint('Start button tapped for Notebook: ${event.notebookTitle}');
    // In a real app, you would perform navigation to the notebook details screen
    // emit(HomeNavigating('/notebook_details', data: event.notebookTitle));
    // emit(HomeLoaded(selectedIndex: state.selectedIndex));
  }

  // Handles the ViewAllNotebooksTapped event
  Future<void> _onViewAllNotebooksTapped(
      ViewAllNotebooksTapped event, Emitter<HomeState> emit) async {
    debugPrint('View All Notebooks button tapped.');
    // In a real app, you would perform navigation to the all notebooks screen
    // emit(HomeNavigating('/all_notebooks'));
    // emit(HomeLoaded(selectedIndex: state.selectedIndex));
  }
}
