import 'dart:io';

import 'package:instagram/Post/comments/comment_entity.dart';
import 'package:instagram/Post/postModel/post_model.dart';
import 'package:instagram/Post/postRepository/post_repo.dart';
import 'package:instagram/Post/postService/post_service.dart';
import 'package:instagram/Post/post_entity.dart';




class PostRepositoryWork implements PostRepository {
  PostRepositoryWork(this.postService);

  final PostService postService;
  @override
  Future<void> deletePostFromDb(String postId) async {
    await postService.deletePostFromDb(postId);
  }

  @override
  Future<PostEntity> getPostByIdFromDb(String postId) async {
    return postService.getPostByIdFromDb(postId);
  }

  @override
  Stream<List<PostEntity>> getPostsFromDB() async* {
    await for (final List<PostModel> models in postService.getPostsFromDB()) {
      yield models.map((e) => PostEntity.fromModel(e)).toList();
    }
  }

  @override
  Future<void> savePostTODb(PostEntity postEntity) async {
    await postService.savePostTODb(postEntity.toModel());
  }

  @override
  Future<void> updatePostInDb(PostEntity postEntity) async {
    await postService.updatePostInDb(postEntity.toModel());
  }

  @override
  Future<void> uploadPostPictureToDb(String postid, File file) async {
    await postService.uploadPostPictureToDb(postid, file);
  }

  @override
  Future<void> sendComment(String postId, CommentEntity? comment) async {
    await postService.sendComment(postId, comment?.toModel());
  }

  @override
  Stream<List<CommentEntity>> getComments(String postId) async* {
    await for (final comment in postService.getComments(postId)) {
      yield comment.map((e) => CommentEntity.fromModel(e)).toList();
    }
  }
}