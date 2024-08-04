import 'package:instagram/Post/post_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'post_model_json.dart';

@JsonSerializable()
class PostModel extends PostEntity {
  PostModel({
    super.description,
    super.uid,
    super.postPicture,
    super.postId,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}