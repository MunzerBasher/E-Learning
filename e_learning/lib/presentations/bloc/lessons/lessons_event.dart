part of 'lessons_bloc.dart';

abstract class VideoLessonEvent extends Equatable {
  const VideoLessonEvent();

  @override
  List<Object> get props => [];
}

/// حدث لتحميل الفيديوهات التعليمية
class LoadVideoLessons extends VideoLessonEvent {}