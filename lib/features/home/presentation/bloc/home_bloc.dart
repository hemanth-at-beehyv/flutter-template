import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/home/domain/usecases/get_users_usecase.dart';
import 'package:template/features/home/presentation/bloc/home_event.dart';
import 'package:template/features/home/presentation/bloc/home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase getUsers;
  
  HomeBloc({required this.getUsers}) : super(const HomeInitial()) {
    on(_onLoadUsers);
    on(_onRefreshUsers);
  }
  
  Future _onLoadUsers(
    LoadUsersEvent event,
    Emitter emit,
  ) async {
    try {
      emit(const HomeLoading());
      final users = await getUsers.call();
      emit(HomeLoaded(users));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
  
  Future _onRefreshUsers(
    RefreshUsersEvent event,
    Emitter emit,
  ) async {
    try {
      emit(const HomeLoading());
      final users = await getUsers.call();
      emit(HomeLoaded(users));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}