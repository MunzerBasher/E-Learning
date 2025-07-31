part of 'suggestedexams_bloc.dart';

abstract class SuggestedexamsEvent extends Equatable {
  const SuggestedexamsEvent();

  @override
  List<Object> get props => [];
}


class SuggestedexamsLoading extends SuggestedexamsEvent{}
