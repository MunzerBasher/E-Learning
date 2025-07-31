part of 'notebooks_bloc.dart';

abstract class NotebooksState extends Equatable {
  const NotebooksState();

  @override
  List<Object> get props => [];
}

class NotebooksInitial extends NotebooksState {}

class NotebooksLoading extends NotebooksState {}

class NotebooksLoaded extends NotebooksState {
  final List<Notebooks> notebooks;

  const NotebooksLoaded(this.notebooks);
  @override
  List<Object> get props => [];
}

class NotebooksError extends NotebooksState {}
