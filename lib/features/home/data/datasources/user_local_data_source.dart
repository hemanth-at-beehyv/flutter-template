import 'package:hive/hive.dart';
import 'package:template/features/home/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getUsers();
  Future<void> cacheUsers(List users);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Box<UserModel> usersBox;
  
  UserLocalDataSourceImpl({required this.usersBox});
  
  @override
  Future<List<UserModel>> getUsers() async {
    return usersBox.values.toList();
  }
  
  @override
  Future<void> cacheUsers(List users) async {
    await usersBox.clear();
    for (var user in users) {
      await usersBox.put(user.id, user);
    }
  }
}