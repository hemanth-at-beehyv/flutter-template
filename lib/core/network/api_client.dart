import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template/features/home/data/models/user_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.example.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  
  @GET("/users")
  Future<List<UserModel>> getUsers();
  
  @GET("/users/{id}")
  Future<UserModel> getUserById(@Path("id") int id);
  
  @POST("/users")
  Future<void> createUser(@Body() UserModel user);
}