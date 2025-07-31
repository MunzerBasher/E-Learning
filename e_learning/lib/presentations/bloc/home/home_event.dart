part of 'home_bloc.dart';

// Abstract base class for all Home Screen events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends HomeEvent{}


class TabChanged extends HomeEvent {
  final int newIndex;
  const TabChanged(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

// Event triggered when a "Live Now" card's join button is tapped
class LiveNowJoinTapped extends HomeEvent {
  final String sessionName;
  const LiveNowJoinTapped(this.sessionName);

  @override
  List<Object> get props => [sessionName];
}

// Event triggered when an "Exam" card's start button is tapped
class ExamStartTapped extends HomeEvent {
  final String examTitle;
  const ExamStartTapped(this.examTitle);

  @override
  List<Object> get props => [examTitle];
}


class NotebookStartTapped extends HomeEvent {
  final String notebookTitle;
  const NotebookStartTapped(this.notebookTitle);

  @override
  List<Object> get props => [notebookTitle];
}


class ViewAllNotebooksTapped extends HomeEvent {}
