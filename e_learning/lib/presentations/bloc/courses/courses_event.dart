part of 'courses_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

/// حدث لتحميل الدورات
class LoadCourses extends CourseEvent {}