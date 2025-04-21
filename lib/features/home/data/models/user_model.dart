
// ignore_for_file: overridden_fields

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:template/features/home/domain/entities/user.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserModel extends User {
  @override
  @HiveField(0)
  final int id;
  
  @override
  @HiveField(1)
  final String name;
  
  @override
  @HiveField(2)
  final String email;
  
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
  }) : super(id: id, name: name, email: email);
  
  factory UserModel.fromJson(Map<String, dynamic> json) => 
      _$UserModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  
  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    name: user.name,
    email: user.email,
  );
}