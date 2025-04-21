import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/app.dart';
import 'package:template/config/hive.dart';
import 'package:template/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();
  
  // Initialize Hive
  await HiveConfig.init();
  
  // Initialize service locator
  await setupServiceLocator();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}