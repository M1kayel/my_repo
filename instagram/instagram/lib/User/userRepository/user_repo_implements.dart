import 'dart:io';

import 'package:instagram/User/userModel/user_model.dart';
import 'package:instagram/User/userRepository/user_repo.dart';
import 'package:instagram/User/userService/user_service.dart';
import 'package:instagram/User/user_entity.dart';


class UserRepositoryWork implements UserRepository {
  UserRepositoryWork(this.userService);

  final UserService userService;
  @override
  Future<void> saveUserToDb(UserEntity userEntity) async {
    userService.saveUserToDb(userEntity.toModel());
  }

  @override
  Future<UserEntity> getUserFromDb(String uid) async {
    return UserEntity.fromModel(await userService.getUserByIdFromDb(uid));
  }

  @override
  Future<void> uploadProfilePicture(String userId, File file) {
    return userService.uploadProfilePicture(userId, file);
  }

  @override
  Stream<List<UserEntity>> getUsersFromDB() async* {
    await for (final List<UserModel> models in userService.getUsersFromDB()) {
      yield models.map((e) => UserEntity.fromModel(e)).toList();
      
    }
    
  }
  
  @override
  Future<void> follow(String uid, String followingId) async {
    await userService.follow(uid, followingId);
  }
}