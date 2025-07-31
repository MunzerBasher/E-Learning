part of 'suggestedexams_bloc.dart';

abstract class SuggestedexamsState extends Equatable {
  const SuggestedexamsState();

  @override
  List<Object> get props => [];
}

class SuggestedexamsInitial extends SuggestedexamsState {}

class SuggestedexamLoading extends SuggestedexamsState {}

class SuggestedexamLoaded extends SuggestedexamsState {
  final List<ExamDetails> list;
  const SuggestedexamLoaded(this.list);
  @override
  List<Object> get props => [list];
}

class SuggestedexamsError extends SuggestedexamsState {
  final String error;
  const SuggestedexamsError(this.error);

  @override
  List<Object> get props => [error];
}
