import 'package:equatable/equatable.dart';
import 'package:template/features/home/domain/entities/user.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<User> users;
  
  const HomeLoaded(this.users);
  
  @override
  List get props => [users];
}

class HomeError extends HomeState {
  final String message;
  
  const HomeError(this.message);
  
  @override
  List get props => [message];
}