import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/di/service_locator.dart';
import 'package:template/features/home/presentation/bloc/home_bloc.dart';

class AppProviders{
  static final List<BlocProvider> providers = [
        BlocProvider<HomeBloc>(
          create: (context) => serviceLocator(),
        ),
  ];
}