import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Auth/authBloc/auth_bloc.dart';
import 'package:instagram/Auth/authRepository/auth_repo.dart';
import 'package:instagram/Auth/authRepository/auth_repo_implements.dart';
import 'package:instagram/Auth/authService/auth_service.dart';
import 'package:instagram/Auth/authService/auth_service_implements.dart';
import 'package:instagram/app_theme/app_theme_imp.dart';
import 'package:instagram/app_theme/theme/theme_cubit.dart';
import 'package:instagram/screens/signIn_screen.dart';
import 'package:instagram/Media/mediaBloc/media_bloc.dart';
import 'package:instagram/Media/mediaRepository/media_repo.dart';
import 'package:instagram/Media/mediaRepository/media_repo_implements.dart';
import 'package:instagram/Media/mediaService/media_service.dart';
import 'package:instagram/Media/mediaService/media_service_implements.dart';
import 'package:instagram/Post/postBloc/post_bloc.dart';
import 'package:instagram/Post/postRepository/post_repo.dart';
import 'package:instagram/Post/postRepository/post_repo_implements.dart';
import 'package:instagram/Post/postService/post_service.dart';
import 'package:instagram/Post/postService/post_service_implements.dart';
import 'package:instagram/navigation.dart';
import 'package:instagram/User/userBloc/user_bloc.dart';
import 'package:instagram/User/userRepository/user_repo.dart';
import 'package:instagram/User/userRepository/user_repo_implements.dart';
import 'package:instagram/User/userService/user_service.dart';
import 'package:instagram/User/userService/user_service_implements.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDM8qe2W2oGxuNu08W0-af_WHEDwS5vcd4', 
      appId: '1:306466132750:android:cdb1164eafd5ea70557d5f', 
      messagingSenderId: '', 
      projectId: 'instagram-67e28',
     // storageBucket: 'gs://instagram-67e28.appspot.com',
     // databaseURL: 'https://instagram-67e28-default-rtdb.firebaseio.com/'
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  
 @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
            create: (context) => AuthServiceWork(firestore)),
         RepositoryProvider<PostService>(
             create: (context) => PostServiceWork(
                 firebaseFirestore: firestore,
                 firebaseStorage: firebaseStorage, firebaseDatabase: firebaseDatabase)),
         RepositoryProvider<MediaService>(
             create: (context) => MediaServiceWork()),
         RepositoryProvider<AuthRepository>(
             create: (context) =>
                 AuthRepositoryWork(RepositoryProvider.of<AuthService>(context))),
         RepositoryProvider<PostRepository>(
             create: (context) =>
                 PostRepositoryWork(RepositoryProvider.of<PostService>(context))),
         RepositoryProvider<UserService>(
             create: (context) => UserServiceWork(firestore, firebaseStorage)),
         RepositoryProvider<UserRepository>(
             create: (context) =>
                 UserRepositoryWork(RepositoryProvider.of<UserService>(context))),
         RepositoryProvider<MediaRepository>(
             create: (context) => MediaRepositoryWork(
                 RepositoryProvider.of<MediaService>(context))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeModeCubit>(
            create: (context) => ThemeModeCubit(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(RepositoryProvider.of<AuthRepository>(context)),
          ),
           BlocProvider<MediaBloc>(
             create: (context) =>
                 MediaBloc(RepositoryProvider.of<MediaRepository>(context)),
           ),
           BlocProvider<UserBloc>(
             create: (context) =>
                 UserBloc(RepositoryProvider.of<UserRepository>(context)),
           ),
           BlocProvider<PostBloc>(
             create: (context) =>
                 PostBloc(RepositoryProvider.of<PostRepository>(context)),
           ),
        ],
          child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              title: 'Flutter Demo',
              themeMode: state.themeMode,
              theme: AppThemeData(context: context).lightTheme,
              darkTheme: AppThemeData(context: context).darkTheme,
              home: const GoogleLogin(),
            );
          },
        ),
      ),
    );
  }
}