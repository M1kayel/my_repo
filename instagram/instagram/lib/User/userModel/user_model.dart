import 'package:instagram/User/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user_model_json.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    super.username,
    super.name,
    super.bio,
    super.profilePicture,
    super.followerList,
    super.followingList,
    super.uid,
    super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}