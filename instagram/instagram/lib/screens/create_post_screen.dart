import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Auth/authBloc/auth_bloc.dart';
import 'package:instagram/Media/mediaBloc/media_bloc.dart';
import 'package:instagram/Post/postBloc/post_bloc.dart';
import 'package:instagram/Post/post_entity.dart';
import 'package:instagram/widgets/constant_gaps.dart';
import 'package:uuid/uuid.dart';


class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, poststate) {
        if (poststate is MediaFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(poststate.error ?? ''),
            ),
          );
        }
      },
      builder: (context, poststate) {
        return BlocConsumer<MediaBloc, MediaState>(
          listener: (context, mediaState) {
            if (mediaState is MediaFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mediaState.error ?? ''),
                ),
              );
            }
          },
          builder: (context, mediaState) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Create Post'),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      final postId = const Uuid().v6();
                      context.read<PostBloc>().add(SavePostToDbEvent(
                              postEntity: PostEntity(
                            postId: postId,
                            description: _descriptionController.text,
                            uid: context
                                    .read<AuthBloc>()
                                    .state
                                    .userCredential
                                    ?.user
                                    ?.uid ??
                                '',
                          )));
                      context.read<PostBloc>().add(UploadPostPhotoEvent(
                          postId: postId, file: mediaState.fileImage!.file));
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.done),
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Gaps.large, vertical: Gaps.large),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<MediaBloc>()
                              .add(UploadPictureFromGalleryEvent());
                        },
                        child: SizedBox(
                          height: 550,
                          // color: Colors.white,
                          child: Image.network(
                              'https://avatars.githubusercontent.com/u/14101776?s=280&v=4'),
                        ),
                      ),
                      SizedBox(height: Gaps.largest),
                      const Text(
                        'Description',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}