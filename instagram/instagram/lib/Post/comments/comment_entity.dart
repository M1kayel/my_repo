import 'dart:core';

import 'package:instagram/Post/comments/commentModel/comment_model.dart';


//import '../../data/models/chat_model.dart';

class CommentEntity {
  const CommentEntity({this.postId, this.uid, this.comment});

  factory CommentEntity.fromModel(CommentModel model) => CommentEntity(
        postId: model.postId,
        uid: model.uid,
        comment: model.comment
      );

  CommentModel toModel() {
    return CommentModel(
      postId: postId,
      uid: uid,
      comment: comment,
    );
  }
  final String? postId;
  final String? uid;
  final String? comment;
}
