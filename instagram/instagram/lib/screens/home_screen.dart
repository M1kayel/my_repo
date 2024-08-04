import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/Auth/authBloc/auth_bloc.dart';
import 'package:instagram/Post/postBloc/post_bloc.dart';
import 'package:instagram/Post/post_widget.dart';
import 'package:instagram/User/userBloc/user_bloc.dart';
import 'package:instagram/widgets/drop_down_menu_widget.dart';
import '../../../widgets/story_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<UserBloc>().add(const GetUsersEvent());
    context.read<PostBloc>().add(const GetAllPostsFromDbEvent());
    final uid = context.read<AuthBloc>().state.userCredential?.user?.uid ?? '';
    context.read<UserBloc>().add(GetUserDataByIDEvent(uid: uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDataFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error ?? '')));
        }
      },
      builder: (context, userstate) {
        if (userstate is UserDataLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              'assets/Group.svg',
              width: 40,
              height: 40,
            ),
            actions: [
              IconButton(
                onPressed: () => showModalBottomSheet(
                  builder: (context) => SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBar(
                          automaticallyImplyLeading: false,
                          title: const Text('Create'),
                          actions: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        DropDownMenuWidget(
                          myicon: Icons.app_registration_rounded,
                          text: 'Reel',
                          onPressed: () {},
                        ),
                        DropDownMenuWidget(
                          myicon: Icons.playlist_add_outlined,
                          text: 'Post',
                          onPressed: () {
                            Navigator.pushNamed(context, '/add_post_page');
                          },
                        ),
                        DropDownMenuWidget(
                          myicon: Icons.add_circle_outline_outlined,
                          text: 'Story',
                          onPressed: () {},
                        ),
                        DropDownMenuWidget(
                          myicon: Icons.spatial_audio_rounded,
                          text: 'Story Highlight',
                          onPressed: () {},
                        ),
                        DropDownMenuWidget(
                          myicon: Icons.live_tv_sharp,
                          text: 'Live',
                          onPressed: () {},
                        ),
                        DropDownMenuWidget(
                          myicon: Icons.menu_book_outlined,
                          text: 'Guide',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  context: context,
                ),
                icon: const Icon(Icons.add_box_outlined),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/messages_home_page');
                },
                icon: const Icon(Icons.message_outlined),
              ),
            ],
          ),
          body: BlocConsumer<PostBloc, PostState>(
            listener: (context, state) {
              if (state is PostDataFailed) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error ?? '')));
              }
            },
            builder: (context, poststate) {
              return ListView.builder(
                itemCount: (poststate.postsList?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? SizedBox(
                          height: 110,
                          child: userstate is UserDataLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: userstate.usersList?.length ?? 0,
                                  itemBuilder: (context, index) { print(context);
                                    return StoryWidget(
                                      username: userstate
                                              .usersList?[index].username ??
                                          '',
                                      profilePicture: userstate
                                          .usersList?[index].profilePicture,
                                    );
                                    
                                  },
                                ),
                               
                        )
                      : poststate is PostDataLoading &&
                              userstate is UserDataLoading
                              
                          ? const Center(child: CircularProgressIndicator())
                          : PostWidget(
                              postId: poststate.postsList?[index - 1].postId,
                              userState: userstate,
                              username: userstate.usersList
                                      ?.where((element) =>
                                          element.uid ==
                                          poststate.postsList?[index - 1].uid)
                                      .firstOrNull
                                      ?.username ??
                                  'no username',
                              profilePhoto: userstate.usersList
                                  ?.where((element) =>
                                      element.uid ==
                                      poststate.postsList?[index - 1].uid)
                                  .firstOrNull
                                  ?.profilePicture,
                              postPhoto:
                                  poststate.postsList?[index - 1].postPicture,
                              description:
                                  poststate.postsList?[index - 1].description,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    '/users_profile_page',
                                    arguments:
                                        poststate.postsList?[index - 1].uid);
                              },
                            );
                },
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation),
            label: 'Reels',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile_page');
                  },
                  icon: const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                ),
                label: 'Account',
              ),
            ],
            selectedItemColor: Colors.white, // Set color for the selected item
            unselectedItemColor: Colors.white54, // Set color for unselected items
            backgroundColor: Colors.black, 
          ),
        );
      },
    );
  }
}