part of 'welcome_bloc.dart';


abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}



class WelcomeInitial extends WelcomeState {}



class WelcomeLoading extends WelcomeState {
  final String message;
  const WelcomeLoading(this.message);

  @override
  List<Object> get props => [message];
}

class WelcomeSuccess extends WelcomeState {
  final String userType; 
  const WelcomeSuccess(this.userType);

  @override
  List<Object> get props => [userType];
}


class WelcomeError extends WelcomeState {
  final String message;
  const WelcomeError(this.message);

  @override
  List<Object> get props => [message];
}
