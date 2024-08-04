import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/Auth/authBloc/auth_bloc.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginGoogleFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? ''),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: SvgPicture.asset(
              'assets/Group.svg',
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(height: 280),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(1, 149, 247, 1),
              ),
              child: const Text(
                'Continue with google',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.read<AuthBloc>().add(LoginGoogleEvent());
                Navigator.of(context).pushReplacementNamed('/homepage');
              },
            ),
          ),
        ]
        ),
        );
      },
    );
  }
}