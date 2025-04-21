import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/core/network/api_client.dart';
import 'package:template/features/home/data/datasources/user_local_data_source.dart';
import 'package:template/features/home/data/datasources/user_remote_data_source.dart';
import 'package:template/features/home/data/models/user_model.dart';
import 'package:template/features/home/data/repositories/home_repository_impl.dart';
import 'package:template/features/home/domain/repositories/home_repository.dart';
import 'package:template/features/home/domain/usecases/get_users_usecase.dart';
import 'package:template/features/home/presentation/bloc/home_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future setupServiceLocator() async {
  // Core
  serviceLocator.registerLazySingleton(() => Connectivity());
  
  // Dio setup
  final dio = Dio();
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    error: true,
  ));
  serviceLocator.registerLazySingleton<Dio>(() => dio);
  
  // API Client
  serviceLocator.registerLazySingleton<ApiClient>(
    () => ApiClient(serviceLocator()),
  );
  
  // Local Storage
  serviceLocator.registerLazySingleton<Box<UserModel>>(
    () => Hive.box<UserModel>('users'),
  );
  
  // Data Sources
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(apiClient: serviceLocator()),
  );
  
  serviceLocator.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(usersBox: serviceLocator<Box<UserModel>>()),
  );
  
  // Repositories
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      connectivity: serviceLocator(),
    ),
  );

  // Usecases
  serviceLocator.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(serviceLocator()),
  );
  
  // BLoCs
  serviceLocator.registerFactory<HomeBloc>(
    () => HomeBloc(getUsers: serviceLocator()),
  );
}