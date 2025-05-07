import 'package:template/core/network/api_client.dart';
import 'package:template/features/home/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;
  
  UserRemoteDataSourceImpl({required this.apiClient});
  
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      // In a real app, you would use:
      // final users = await apiClient.getUsers();
      
      // Simulating API response for demo purposes
      await Future.delayed(const Duration(seconds: 1));
      return [
        const UserModel(id: 1, name: 'John Doe', email: 'john@example.com'),
        const UserModel(id: 2, name: 'Jane Smith', email: 'jane@example.com'),
        const UserModel(id: 3, name: 'Bob Johnson', email: 'bob@example.com'),
      ];
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}