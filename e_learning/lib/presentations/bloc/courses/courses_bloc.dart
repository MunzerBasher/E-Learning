import 'package:dio/dio.dart';
import 'package:e_learning/domain/entities/course.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courses_event.dart';
part 'courses_state.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final Dio _dio = Dio(); 
  final String _apiUrl = 'http://sanad-service.runasp.net/api/Course/GetCourses';

  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>(_onLoadCourses);
  }

  /// معالج حدث [LoadCourses]
  Future<void> _onLoadCourses(LoadCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading()); 
    try {
      final response = await _dio.get(_apiUrl); 
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Course> courses = data.map((json) => Course.fromJson(json)).toList();
        emit(CourseLoaded(courses)); // إصدار حالة النجاح مع الدورات
      } else {
        emit(CourseError('فشل تحميل الدورات: ${response.statusCode}')); // إصدار حالة الخطأ
      }
    } on DioException catch (e) {
      
      if (e.response != null) {
        emit(CourseError('خطأ في الخادم: ${e.response?.statusCode} - ${e.response?.data}'));
      } else {
        emit(CourseError('خطأ في الشبكة: ${e.message}'));
      }
    } catch (e) {
      emit(CourseError('حدث خطأ غير متوقع: $e')); 
    }
  }
}
