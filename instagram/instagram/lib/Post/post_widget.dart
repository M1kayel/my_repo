import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Post/comments/comment_entity.dart';
import 'package:instagram/Post/postBloc/post_bloc.dart';
import 'package:instagram/User/userBloc/user_bloc.dart';


class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.username,
    required this.userState,
    this.onPressed,
    this.description,
    this.profilePhoto,
    this.postPhoto,
    this.postId
  });

  final String username;
  final String? description;
  final String? profilePhoto;
  final String? postPhoto;
  final String? postId;
  final UserState userState;
  final void Function()? onPressed;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;
  int likeCount = 0;

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.pink,
              backgroundImage: widget.profilePhoto != null
                  ? CachedNetworkImageProvider(widget.profilePhoto!)
                  : null,
            ),
            const SizedBox(
              width: 12,
            ),
            TextButton(
              onPressed: widget.onPressed,
              child: Text(
                widget.username,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 400,
          height: 400,
          color: Colors.pink,
          child: widget.postPhoto != null
              ? CachedNetworkImage(imageUrl: widget.postPhoto!)
              : null,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: toggleLike,
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.white,
                  ),
                ),
                Text(
                  '$likeCount',
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<PostBloc>()
                        .add(GetCommentEvent(postId: widget.postId ?? ''));
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return BlocConsumer<PostBloc, PostState>(
                          listener: (context, state) {},
                          builder: (context, postState) {
                            return Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    AppBar(
                                      title: const Text('Comments'),
                                      leading: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.arrow_back),
                                      ),
                                      actions: const [Icon(Icons.comment_outlined)],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount:
                                            postState.commentEntity?.length ??
                                                0,
                                        itemBuilder: (context, index) {
                                          final user = widget.userState.usersList
                                              ?.where(
                                                (element) =>
                                                    element.uid ==
                                                    postState
                                                        .commentEntity?[index]
                                                        .uid,
                                              )
                                              .firstOrNull;
                                          final comment =
                                              postState.commentEntity?[index];
                                          return ListTile(
                                            title: Text(user?.username ?? ''),
                                            subtitle:
                                                Text(comment?.comment ?? ''),
                                            leading: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.white,
                                              backgroundImage: user
                                                          ?.profilePicture !=
                                                      null
                                                  ? CachedNetworkImageProvider(
                                                      user!.profilePicture!)
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: controller,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            context.read<PostBloc>().add(
                                                  SendCommentEvent(
                                                      postId:
                                                          widget.postId ?? '',
                                                      comment: CommentEntity(
                                                          postId: widget.postId,
                                                          uid: widget.userState
                                                              .userEntity?.uid,
                                                          comment: controller
                                                              .text)),
                                                );
                                            controller.text = '';
                                          },
                                          icon: const Icon(Icons.send),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.comment_rounded),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.send)),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border))
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(widget.description ?? 'No description'),
      ],
    );
  }
}