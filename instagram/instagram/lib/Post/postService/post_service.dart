import 'dart:io';

import 'package:instagram/Post/comments/commentModel/comment_model.dart';
import 'package:instagram/Post/postModel/post_model.dart';



abstract class PostService {
  Future<void> savePostTODb(PostModel postModel);
  Future<void> updatePostInDb(PostModel postModel);
  Future<void> deletePostFromDb(String postid);
  Future<PostModel> getPostByIdFromDb(String postid);
  Stream<List<PostModel>> getPostsFromDB();
  Future<void> uploadPostPictureToDb(String postid, File file);
  Future<void> sendComment(String postId, CommentModel? comment);
  Stream<List<CommentModel>> getComments(String postId);
}