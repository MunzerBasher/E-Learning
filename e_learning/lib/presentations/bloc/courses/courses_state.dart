part of 'courses_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

/// حالة التحميل الأولية
class CourseInitial extends CourseState {}

/// حالة تحميل الدورات
class CourseLoading extends CourseState {}

/// حالة تم تحميل الدورات بنجاح
class CourseLoaded extends CourseState {
  final List<Course> courses;

  const CourseLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

/// حالة حدوث خطأ أثناء تحميل الدورات
class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object> get props => [message];
}
