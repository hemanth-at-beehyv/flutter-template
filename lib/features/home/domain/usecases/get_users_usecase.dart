import 'package:template/features/home/domain/entities/user.dart';
import 'package:template/features/home/domain/repositories/home_repository.dart';

class GetUsersUseCase {
  final HomeRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<User>> call() async {
    return await repository.getUsers();
  }
}
