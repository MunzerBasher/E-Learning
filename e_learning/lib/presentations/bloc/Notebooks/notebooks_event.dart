part of 'notebooks_bloc.dart';

abstract class NotebooksEvent extends Equatable {
  const NotebooksEvent();

  @override
  List<Object> get props => [];
}

class NotebooksLoadingEvent extends NotebooksEvent {}


