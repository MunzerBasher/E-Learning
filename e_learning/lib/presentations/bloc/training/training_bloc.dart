import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'training_event.dart';
part 'training_state.dart';


class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(TrainingInitial()) {
    on<LoadingTraining>((event, emit) async {
      emit(TrainingLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(TrainingLoaded());
    });
  }
}
