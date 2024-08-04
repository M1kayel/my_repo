import 'package:instagram/Post/comments/comment_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_model_json.dart';

@JsonSerializable()
class CommentModel extends CommentEntity {
  CommentModel({
    super.comment, super.postId, super.uid
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}