part of 'lessons_bloc.dart';

abstract class VideoLessonState extends Equatable {
  const VideoLessonState();

  @override
  List<Object> get props => [];
}

/// حالة التحميل الأولية
class VideoLessonInitial extends VideoLessonState {}

/// حالة تحميل الفيديوهات التعليمية
class VideoLessonLoading extends VideoLessonState {}

/// حالة تم تحميل الفيديوهات التعليمية بنجاح
class VideoLessonLoaded extends VideoLessonState {
  final List<VideoLesson> lessons;

  const VideoLessonLoaded(this.lessons);

  @override
  List<Object> get props => [lessons];
}

/// حالة حدوث خطأ أثناء تحميل الفيديوهات التعليمية
class VideoLessonError extends VideoLessonState {
  final String message;

  const VideoLessonError(this.message);

  @override
  List<Object> get props => [message];
}
