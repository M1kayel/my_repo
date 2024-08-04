import 'package:flutter/material.dart';
import 'package:instagram/screens/create_post_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/messages_screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/users_profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/homepage':
        return MaterialPageRoute(builder: (_) =>  const HomePage());
       case '/profile_page':
         return MaterialPageRoute(builder: (_) => const ProfilePage());
       case '/add_post_page':
         return MaterialPageRoute(builder: (_) => const CreatePostPage());
       case '/messages_home_page':
         return MaterialPageRoute(builder: (_) =>  MessagesPage());
       case '/users_profile_page':
         return MaterialPageRoute(
             builder: (_) =>
                 UsersProfilePage(uid: settings.arguments.toString()));
       default:
         throw Exception('No page');
    }
  }
}
