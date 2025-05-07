import 'package:template/features/home/domain/entities/user.dart';

abstract class HomeRepository {
  Future<List<User>> getUsers();
}