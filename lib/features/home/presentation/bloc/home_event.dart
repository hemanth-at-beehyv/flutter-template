import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  
  @override
  List get props => [];
}

class LoadUsersEvent extends HomeEvent {
  const LoadUsersEvent();
}

class RefreshUsersEvent extends HomeEvent {
  const RefreshUsersEvent();
}