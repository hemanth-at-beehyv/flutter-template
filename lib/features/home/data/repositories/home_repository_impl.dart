import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:template/features/home/data/datasources/user_local_data_source.dart';
import 'package:template/features/home/data/datasources/user_remote_data_source.dart';
import 'package:template/features/home/domain/entities/user.dart';
import 'package:template/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final Connectivity connectivity;
  
  HomeRepositoryImpl({
    required this.remoteDataSource, 
    required this.localDataSource,
    required this.connectivity,
  });
  
  @override
  Future<List<User>> getUsers() async {
    try {
      // Check connectivity
      final connectivityResult = await connectivity.checkConnectivity();
      final hasConnectivity = connectivityResult != ConnectivityResult.none;
      
      if (hasConnectivity) {
        // Get from remote source
        final remoteUsers = await remoteDataSource.getUsers();
        // Cache for offline use
        await localDataSource.cacheUsers(remoteUsers);
        return remoteUsers;
      } else {
        // Get from local cache
        return await localDataSource.getUsers();
      }
    } catch (e) {
      // Try to get from cache if remote fails
      try {
        return await localDataSource.getUsers();
      } catch (_) {
        throw Exception('Failed to load users: $e');
      }
    }
  }
}