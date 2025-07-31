part of 'home_bloc.dart';



abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}


class HomeInitial extends HomeState {
  final int selectedIndex;
  const HomeInitial({this.selectedIndex = 0}); 
  

  @override
  List<Object> get props => [selectedIndex];
}


class HomeLoading extends HomeState {
  final int selectedIndex;
  const HomeLoading({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}

class HomeLivesLoading extends HomeState {
  
  const HomeLivesLoading();

  @override
  List<Object> get props => [];
}

class HomeLivesLoaded extends HomeState {
  final List<Profile> lives ;
  const HomeLivesLoaded({required this.lives});

  @override
  List<Object> get props => [lives];
}



class HomeLoaded extends HomeState {
  final int selectedIndex;
  const HomeLoaded({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}

// State indicating an error occurred on the Home Screen
class HomeError extends HomeState {
  final String message;
  final int selectedIndex;
  const HomeError(this.message, {required this.selectedIndex});

  @override
  List<Object> get props => [message, selectedIndex];
}

