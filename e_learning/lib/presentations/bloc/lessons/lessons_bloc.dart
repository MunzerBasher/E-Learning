import 'dart:async';
import 'package:dio/dio.dart';
import 'package:e_learning/domain/entities/videolesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class VideoLessonBloc extends Bloc<VideoLessonEvent, VideoLessonState> {
  final Dio _dio = Dio();
  final String _apiUrl = 'http://your-api-service.com/api/VideoLessons/GetLessons';

  VideoLessonBloc() : super(VideoLessonInitial()) {
    on<LoadVideoLessons>(_onLoadVideoLessons);
  }

  /// معالج حدث [LoadVideoLessons]
  Future<void> _onLoadVideoLessons(LoadVideoLessons event, Emitter<VideoLessonState> emit) async {
    emit(VideoLessonLoading()); 
    try {
        final response = await _dio.get(_apiUrl); 
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<VideoLesson> lessons = data.map((json) => VideoLesson.fromJson(json)).toList();
        emit(VideoLessonLoaded(lessons)); 
      } 
     
    } on DioException catch (e) {
      // التعامل مع أخطاء Dio
      if (e.response != null) {
        emit(VideoLessonError('خطأ في الخادم: ${e.response?.statusCode} - ${e.response?.data}'));
      } else {
        emit(VideoLessonError('خطأ في الشبكة: ${e.message}'));
      }
    } catch (e) {
      emit(VideoLessonError('حدث خطأ غير متوقع: $e')); 
    }
  }
}