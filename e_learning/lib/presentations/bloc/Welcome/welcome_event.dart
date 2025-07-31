part of 'welcome_bloc.dart';


abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}


class StudentLoginPressed extends WelcomeEvent {}


class TeacherLoginPressed extends WelcomeEvent {}


class GoogleSignInPressed extends WelcomeEvent {}


