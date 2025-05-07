import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/features/home/data/models/user_model.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register the adapter for UserModel
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>('users');
  }
}
