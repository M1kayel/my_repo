import 'dart:io';

import 'package:instagram/Post/comments/comment_entity.dart';
import 'package:instagram/Post/post_entity.dart';


abstract class PostRepository {
  Future<void> savePostTODb(PostEntity postEntity);
  Future<void> updatePostInDb(PostEntity postEntity);
  Future<void> deletePostFromDb(String postId);
  Future<PostEntity> getPostByIdFromDb(String postId);
  Stream<List<PostEntity>> getPostsFromDB();
  Future<void> uploadPostPictureToDb(String postid, File file);
  Stream<List<CommentEntity>> getComments(String postId);
  Future<void> sendComment(String postId, CommentEntity? comment);
}